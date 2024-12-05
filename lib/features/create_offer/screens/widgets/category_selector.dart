import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/common/widgets/images/circular_image.dart';
import 'package:tawfeer/features/create_offer/controllers/create_offer_controller.dart';
import 'package:tawfeer/utils/constants/categories.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/sizes.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  void _showCategoryPicker(
      BuildContext context, CreateOfferController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: TCategories.categories.length,
                itemBuilder: (context, index) {
                  final category = TCategories.categories[index];
                  return ListTile(
                    leading: TCircularImage(
                        image: category.icon,
                        width: TSizes.iconXl,
                        overlayColor: TColors.primary),
                    title: Text(category.name),
                    subtitle: Text(category.description),
                    onTap: () {
                      controller.setCategory(category.name);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateOfferController>();
    return GestureDetector(
      onTap: () => _showCategoryPicker(context, controller),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Obx(() => Text(
              controller.offer.value.category ?? "Select Category",
              style: const TextStyle(color: TColors.primary),
            )),
      ),
    );
  }
}
