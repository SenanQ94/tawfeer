import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:tawfeer/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:tawfeer/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:tawfeer/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:tawfeer/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:tawfeer/utils/constants/image_strings.dart';
import 'package:tawfeer/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              const OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              const OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              const OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
