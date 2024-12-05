import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tawfeer/features/create_offer/models/offer_model.dart';

class CreateOfferController extends GetxController {
  static CreateOfferController get instance => Get.find();
  
  final Rx<Offer> offer = Offer().obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final ImagePicker _picker = ImagePicker();
  final RxList<String> selectedImages = <String>[].obs;

  void setOfferType(String type) {
    offer.update((val) {
      val?.offerType = type;
    });
  }

  void setTitle(String title) {
    offer.update((val) {
      val?.title = title;
    });
  }

  void setDescription(String description) {
    offer.update((val) {
      val?.description = description;
    });
  }

  void setCategory(String category) {
    offer.update((val) {
      val?.category = category;
    });
  }

  void setPrice(String price) {
    if (price.isNotEmpty) {
      offer.update((val) {
        val?.price = double.tryParse(price);
      });
    }
  }

  void setPriceType(String type) {
    offer.update((val) {
      val?.priceType = type;
    });
  }

  Future<void> submitOffer() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Validate offer
      if (!_validateOffer()) {
        return;
      }

      // TODO: Implement API call to submit offer
      await Future.delayed(const Duration(seconds: 2)); // Simulated API call

      Get.snackbar(
        'Erfolg',
        'Ihre Anzeige wurde erfolgreich aufgegeben',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.back(); // Navigate back
    } catch (e) {
      errorMessage.value = 'Ein Fehler ist aufgetreten: $e';
      Get.snackbar(
        'Fehler',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateOffer() {
    if (offer.value.title == null || offer.value.title!.length < 10) {
      errorMessage.value = 'Der Titel muss mindestens 10 Zeichen lang sein';
      return false;
    }
    if (offer.value.description == null || offer.value.description!.isEmpty) {
      errorMessage.value = 'Bitte geben Sie eine Beschreibung ein';
      return false;
    }
    if (offer.value.category == null) {
      errorMessage.value = 'Bitte wählen Sie eine Kategorie';
      return false;
    }
    return true;
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 1200,
      );

      if (image != null) {
        selectedImages.add(image.path);
        offer.update((val) {
          val?.images = selectedImages.toList();
        });
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> pickMultipleImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 80,
        maxWidth: 1200,
      );

      if (images.isNotEmpty) {
        selectedImages.addAll(images.map((image) => image.path));
        offer.update((val) {
          val?.images = selectedImages.toList();
        });
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick images: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeImage(String imagePath) {
    selectedImages.remove(imagePath);
    offer.update((val) {
      val?.images = selectedImages.toList();
    });
  }

  void showImagePickerOptions() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Get.back();
                pickMultipleImages();
              },
            ),
          ],
        ),
      ),
    );
  }
}
