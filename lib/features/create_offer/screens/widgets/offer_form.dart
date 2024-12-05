import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/features/create_offer/controllers/create_offer_controller.dart';
import 'package:tawfeer/features/create_offer/screens/widgets/category_selector.dart';
import 'package:tawfeer/features/create_offer/screens/widgets/price_field.dart';
import 'package:tawfeer/features/create_offer/screens/widgets/price_type_selector.dart';

class OfferForm extends StatelessWidget {
  const OfferForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateOfferController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: "Title",
            hintText: "Enter your title here (min. 10 characters)",
            border: OutlineInputBorder(),
          ),
          onChanged: controller.setTitle,
        ),
        const SizedBox(height: 16),
        const CategorySelector(),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: "Description",
            hintText: "Enter your description here",
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
          onChanged: controller.setDescription,
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(child: PriceField()),
            SizedBox(width: 8),
            Expanded(child: PriceTypeSelector()),
          ],
        )
      ],
    );
  }
}
