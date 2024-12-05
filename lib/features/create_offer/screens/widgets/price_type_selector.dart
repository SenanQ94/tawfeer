import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/features/create_offer/controllers/create_offer_controller.dart';

class PriceTypeSelector extends StatelessWidget {
  const PriceTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateOfferController>();
    return Obx(() => DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          value: controller.offer.value.priceType,
          items: const [
            DropdownMenuItem(
              value: "Fixed Price",
              child: Text("Fixed Price"),
            ),
            DropdownMenuItem(
              value: "Negotiable",
              child: Text("Negotiable"),
            ),
          ],
          onChanged: (value) => controller.setPriceType(value!),
        ));
  }
}
