import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:tawfeer/common/widgets/login_signup/form_divider.dart';
import 'package:tawfeer/common/widgets/login_signup/social_buttons.dart';
import 'package:tawfeer/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
