import 'package:flutter/material.dart';
import 'package:tawfeer/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:tawfeer/utils/constants/categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: TCategories.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = TCategories.categories[index];
            return TVerticalImageText(
              title: category.name,
              image: category.icon,
            );
          }),
    );
  }
}
