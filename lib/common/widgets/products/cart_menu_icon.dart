import 'package:flutter/material.dart';
import 'package:tawfeer/utils/constants/colors.dart';

class TCountCounterIcon extends StatelessWidget {
  const TCountCounterIcon({
    super.key,
    required this.iconColor,
    required this.counter,
    required this.onPressed,
    required this.icon,
  });

  final Color iconColor;
  final String counter;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: TColors.white,
            )),
        Positioned(
          right: 4,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: TColors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                counter,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
