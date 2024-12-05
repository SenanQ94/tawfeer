import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tawfeer/common/widgets/icons/circular_icon.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/device/device_utility.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal_1,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.xs, horizontal: TSizes.sm),
        decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder
                ? Border.all(color: TColors.grey.withOpacity(0.5))
                : null),
        child: Row(
          children: [
            Icon(icon, color: TColors.darkGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Spacer(),
            TCircularIcon(
              icon: Iconsax.location,
              color: dark ? TColors.darkGrey : TColors.white,
              backgroundColor: dark ? TColors.primaryDark : TColors.primary,
            )
            //Icon(, color: TColors.darkGrey),
          ],
        ),
      ),
    );
  }
}
