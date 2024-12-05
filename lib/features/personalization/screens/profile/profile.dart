import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tawfeer/common/widgets/appbar/appbar.dart';
import 'package:tawfeer/common/widgets/icons/circular_icon.dart';
import 'package:tawfeer/common/widgets/images/circular_image.dart';
import 'package:tawfeer/common/widgets/texts/section_heading.dart';
import 'package:tawfeer/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:tawfeer/utils/constants/image_strings.dart';
import 'package:tawfeer/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                /// Profile Picture
                Stack(
                  children: [
                    const TCircularImage(
                        image: TImages.user, width: 120, height: 120),
                    Positioned(
                        bottom: 6,
                        right: 6,
                        child: TCircularIcon(icon: Icons.edit_outlined))
                  ],
                ),

                /// Details
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSectionHeading(
                    title: 'Profile Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(
                    onPressed: () {}, title: 'Name', value: 'Sinan Qarhiely'),
                TProfileMenu(
                    onPressed: () {}, title: 'Username', value: 'sinan_q'),

                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSectionHeading(
                    title: 'Personal Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(
                    onPressed: () {},
                    icon: Iconsax.copy,
                    title: 'User ID',
                    value: 'SinaQ523'),
                TProfileMenu(
                    onPressed: () {},
                    title: 'E-Mail',
                    value: 'sinan.qarhiely@gmail.com'),

                TProfileMenu(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: '+49 1776461077'),
                TProfileMenu(
                    onPressed: () {},
                    title: 'Date of Birth',
                    value: '30-11-1994'),
                TProfileMenu(
                    onPressed: () {},
                    icon: Iconsax.copy,
                    title: 'Subscribed Date',
                    value: '15-10-2024'),

                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(color: Colors.red),
                      )),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
