import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tawfeer/features/chat/screens/chat_list.dart';
import 'package:tawfeer/features/create_offer/screens/create_offer.dart';
import 'package:tawfeer/features/personalization/screens/settings/settings.dart';
import 'package:tawfeer/features/shop/screens/favorite/favorite.dart';
import 'package:tawfeer/features/shop/screens/home/home.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80.0,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home_1), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Favorite'),
            NavigationDestination(icon: Icon(Iconsax.card_add), label: 'Sell'),
            NavigationDestination(
                icon: Icon(Iconsax.messages_3), label: 'Chat'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    FavoriteScreen(),
    CreateOfferScreen(),
    ChatsListScreen(),
    SettingsScreen(),
  ];
}
