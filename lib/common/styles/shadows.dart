import 'package:flutter/cupertino.dart';
import 'package:tawfeer/utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadowLight = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.5),
      blurRadius: 10,
      spreadRadius: 0.5,
      offset: const Offset(0, 1));

  static final verticalProductShadowDark = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.2),
      blurRadius: 10,
      spreadRadius: 0.5,
      offset: const Offset(0, 1));

  static final horizontalProductShadowLight = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.5),
      blurRadius: 10,
      spreadRadius: 0.5,
      offset: const Offset(0, 2));

  static final horizontalProductShadowDark = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.2),
      blurRadius: 10,
      spreadRadius: 0.5,
      offset: const Offset(0, 2));
}
