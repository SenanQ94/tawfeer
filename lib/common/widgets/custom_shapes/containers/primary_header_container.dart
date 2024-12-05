import 'package:flutter/material.dart';
import 'package:tawfeer/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:tawfeer/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.primaryDark : TColors.primary,
        padding: EdgeInsets.only(bottom: 0),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: TCircularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 100,
                  left: -300,
                  child: TCircularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: -100,
                  left: -150,
                  child: TCircularContainer(
                      width: 300,
                      height: 200,
                      radius: 150,
                      backgroundColor: TColors.textWhite.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
