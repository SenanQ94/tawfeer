import 'package:flutter/material.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.xl,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.iconSize = TSizes.lg,
  });

  final double? width, height, size;
  final double? iconSize;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width ?? size,
      height: height ?? size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : dark
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed ?? () {},
        icon: Icon(icon, color: color, size: iconSize ?? size! * 0.5),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        iconSize: iconSize ?? size! * 0.5,
      ),
    );
  }
}
