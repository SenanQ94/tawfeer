import 'package:flutter/material.dart';
import 'package:tawfeer/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/device/device_utility.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(side: BorderSide.none),
            backgroundColor: dark ? TColors.primary : Colors.black),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    );
  }
}
