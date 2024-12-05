import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tawfeer/common/widgets/appbar/appbar.dart';
import 'package:tawfeer/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:tawfeer/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:tawfeer/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:tawfeer/common/widgets/texts/section_heading.dart';
import 'package:tawfeer/features/personalization/screens/profile/profile.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// --Appbar
                  TAppBar(
                      centerTitle: true,
                      title: Text(
                        'Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white),
                      )),

                  /// -- User Profile Card
                  TUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///  -- Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  TSectionHeading(
                      title: 'Account Settings', showActionButton: false),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'Set Shopping delivery address',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, Remove products and move to checkout',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-progress and completed orders',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Coupons',
                    subtitle: 'Set Shopping delivery address',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set Shopping delivery address',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account privacy',
                    subtitle: 'Set Shopping delivery address',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'Set Shopping delivery address',
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load data',
                    subtitle: 'Set Shopping delivery address',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Add, Remove products and move to checkout',
                    trailing: Switch(value: true, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'In-progress and completed orders',
                    trailing: Switch(value: false, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD image quality',
                    subtitle: 'Set Shopping delivery address',
                    trailing: Switch(value: true, onChanged: (value) {}),
                    onTap: () {},
                  ),

                  /// - Logout Button

                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text('Logout'))),
                  const SizedBox(height: TSizes.spaceBtwSections * 1.2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
