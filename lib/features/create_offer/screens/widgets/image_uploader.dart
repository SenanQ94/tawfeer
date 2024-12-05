import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/features/create_offer/controllers/create_offer_controller.dart';
import 'package:tawfeer/utils/constants/colors.dart';

class ImageUploader extends StatelessWidget {
  const ImageUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateOfferController>();

    return Obx(() {
      if (controller.selectedImages.isEmpty) {
        return Column(
          children: [
            const Icon(Icons.camera_alt, size: 50, color: TColors.primary),
            const SizedBox(height: 8),
            const Text(
              "No images selected yet. Add some photos to make your offer stand out.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: controller.showImagePickerOptions,
                  icon: const Icon(Icons.add_a_photo, color: TColors.primary),
                  label: const Text(
                    "Add Photos",
                    style: TextStyle(color: TColors.primary),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Show photo tips dialog
                    Get.dialog(const PhotoTipsDialog());
                  },
                  child: const Text(
                    "Photo Tips",
                    style: TextStyle(color: TColors.primary),
                  ),
                ),
              ],
            )
          ],
        );
      }

      return Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.selectedImages.length + 1,
              itemBuilder: (context, index) {
                if (index == controller.selectedImages.length) {
                  return AddImageButton(
                    onTap: controller.showImagePickerOptions,
                  );
                }
                return ImageThumbnail(
                  imagePath: controller.selectedImages[index],
                  onDelete: () => controller.removeImage(
                    controller.selectedImages[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Get.dialog(const PhotoTipsDialog());
            },
            child: const Text(
              "Photo Tips",
              style: TextStyle(color: TColors.primary),
            ),
          ),
        ],
      );
    });
  }
}

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({
    super.key,
    required this.imagePath,
    required this.onDelete,
  });

  final String imagePath;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(imagePath),
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddImageButton extends StatelessWidget {
  const AddImageButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(color: TColors.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo, color: TColors.primary),
            SizedBox(height: 4),
            Text(
              'Add Photo',
              style: TextStyle(color: TColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoTipsDialog extends StatelessWidget {
  const PhotoTipsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Photo Tips'),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('1. Use good lighting'),
            Text('2. Take photos from multiple angles'),
            Text('3. Show any defects or damage clearly'),
            Text('4. Keep the background clean'),
            Text('5. Avoid using flash if possible'),
            Text('6. Focus on the main item'),
            Text('7. Include size reference when helpful'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text('Got it'),
        ),
      ],
    );
  }
}
