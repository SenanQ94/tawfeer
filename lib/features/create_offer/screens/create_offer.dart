import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tawfeer/common/widgets/appbar/appbar.dart';
import 'package:tawfeer/common/widgets/icons/circular_icon.dart';
import 'package:tawfeer/features/create_offer/controllers/create_offer_controller.dart';
import 'package:tawfeer/features/create_offer/screens/widgets/image_uploader.dart';
import 'package:tawfeer/features/create_offer/screens/widgets/offer_form.dart';
import 'package:tawfeer/features/create_offer/screens/widgets/offer_type_selector.dart';
import 'package:tawfeer/features/create_offer/screens/widgets/submit_button.dart';

class CreateOfferScreen extends StatelessWidget {
  const CreateOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateOfferController());
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Create Offer"),
        actions: [TCircularIcon(icon: Iconsax.eye)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ImageUploader(),
            SizedBox(height: 16),
            OfferTypeSelector(),
            SizedBox(height: 16),
            OfferForm(),
            SizedBox(height: 16),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}
