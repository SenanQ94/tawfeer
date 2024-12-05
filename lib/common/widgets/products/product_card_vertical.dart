import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tawfeer/common/styles/shadows.dart';
import 'package:tawfeer/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tawfeer/common/widgets/icons/circular_icon.dart';
import 'package:tawfeer/common/widgets/images/rounded_image.dart';
import 'package:tawfeer/common/widgets/texts/product_title_text.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/image_strings.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 190,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [
            dark
                ? TShadowStyle.verticalProductShadowDark
                : TShadowStyle.verticalProductShadowLight
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white),
      child: Column(
        children: [
          /// Thumbnail Image, Favorite, New
          TRoundedContainer(
            height: 130,
            width: double.infinity,
            //padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                TRoundedImage(
                  imageUrl: TImages.productImage2,
                  applyImageRadius: true,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  border: Border(
                      bottom: BorderSide(
                          color: dark
                              ? TColors.dark.withOpacity(0.5)
                              : TColors.light.withOpacity(0.5),
                          width: 1)),
                ),

                /// New Button
                Positioned(
                    top: 6,
                    left: 4,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('NEW',
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: TColors.black,
                              fontWeightDelta: 2,
                              fontSizeFactor: 0.9)),
                    )),

                /// Favorite Button
                Positioned(
                    top: 6,
                    right: 4,
                    child:
                        TCircularIcon(icon: Iconsax.heart5, color: Colors.red)),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),

          /// details
          Padding(
            padding: EdgeInsets.only(left: TSizes.sm),
            child: Column(
              children: [
                /// Address
                TProductTitleText(
                  title: 'Goslar - Niedersachsen ',
                  maxLines: 1,
                  smallSize: true,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    /// Description
                    Flexible(
                      child: Text(
                        'Nike Shoes NiedersachsenNiedersachsenNiedersachsenNiedersachsenNiedersachsen',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.labelSmall,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm, vertical: TSizes.xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$35.5',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
