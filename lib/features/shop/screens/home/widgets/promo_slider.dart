import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:tawfeer/common/widgets/images/rounded_image.dart';
import 'package:tawfeer/features/shop/controllers/home_controller.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        LayoutBuilder(
          builder: (context, _) {
            double totalWidth = THelperFunctions.screenWidth() - 100;
            double dotWidth = (totalWidth / banners.length) - 10;

            return Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < banners.length; i++)
                      TCircularContainer(
                        width: controller.carousalCurrentIndex.value == i
                            ? dotWidth
                            : dotWidth * 0.7,
                        height: 4,
                        margin: EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? TColors.primary
                                : TColors.grey,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
