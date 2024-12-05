import 'package:flutter/material.dart';
import 'package:tawfeer/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400.0,
    this.height = 400.0,
    this.radius = 400.0,
    this.padding = 0,
    this.child,
    this.backgroundColor = TColors.white,
    this.margin,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}
