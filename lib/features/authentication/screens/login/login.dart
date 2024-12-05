import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:tawfeer/common/styles/spacing_styles.dart';
import 'package:tawfeer/common/widgets/login_signup/form_divider.dart';
import 'package:tawfeer/common/widgets/login_signup/social_buttons.dart';
import 'package:tawfeer/features/authentication/screens/login/widgets/login_form.dart';
import 'package:tawfeer/features/authentication/screens/login/widgets/login_header.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/constants/text_strings.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title, Subtitle
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
