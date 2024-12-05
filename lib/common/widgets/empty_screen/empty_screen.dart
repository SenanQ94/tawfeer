import 'package:flutter/material.dart';
import 'package:tawfeer/common/styles/spacing_styles.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed,
      required this.buttonText});

  final String image, title, subtitle, buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.4,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Buttons
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: onPressed,
                      child: Text(buttonText)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
