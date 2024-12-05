import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/features/create_offer/controllers/create_offer_controller.dart';

class OfferTypeSelector extends StatelessWidget {
  const OfferTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateOfferController>();
    return Obx(() => Row(
          children: [
            Expanded(
              flex: 2,
              child: RadioListTile<String>(
                value: "I offer",
                groupValue: controller.offer.value.offerType,
                onChanged: (value) => controller.setOfferType(value!),
                title: const Flexible(
                  child: Text("I offer"),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: RadioListTile<String>(
                value: "I am looking for",
                groupValue: controller.offer.value.offerType,
                onChanged: (value) => controller.setOfferType(value!),
                title: const Flexible(
                  child: Text("I am looking for"),
                ),
              ),
            ),
          ],
        ));
  }
}
