import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/features/create_offer/controllers/create_offer_controller.dart';

class PriceField extends StatelessWidget {
  const PriceField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateOfferController>();
    return TextField(
      decoration: const InputDecoration(
        labelText: "Price",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onChanged: controller.setPrice,
    );
  }
}
