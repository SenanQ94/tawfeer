import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawfeer/common/widgets/appbar/appbar.dart';
import 'package:tawfeer/common/widgets/appbar/tabbar.dart';
import 'package:tawfeer/common/widgets/empty_screen/empty_screen.dart';
import 'package:tawfeer/navigation_menu.dart';
import 'package:tawfeer/utils/constants/image_strings.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      animationDuration: const Duration(milliseconds: 100),
      child: Scaffold(
          appBar: TAppBar(
            showBackArrow: false,
            centerTitle: true,
            title: Text(
              'Favorite',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            bottomWidget: const TTabBar(tabs: [
              Tab(child: Text('Favorite')),
              Tab(child: Text('Search')),
              Tab(child: Text('Followed')),
            ]),
          ),
          body: TabBarView(children: [
            Center(
              child: EmptyScreen(
                  image: TImages.deliveredEmailIllustration,
                  title: 'Nothing to show',
                  subtitle: "You can add products to favorite",
                  buttonText: 'show more',
                  onPressed: () => Get.to(const NavigationMenu())),
            ),
            Center(
              child: EmptyScreen(
                  image: TImages.deliveredEmailIllustration,
                  title: 'Nothing to show',
                  subtitle: "You can add products to favorite",
                  buttonText: 'show more',
                  onPressed: () => Get.to(const NavigationMenu())),
            ),
            Center(
              child: EmptyScreen(
                  image: TImages.deliveredEmailIllustration,
                  title: 'Nothing to show',
                  subtitle: "You can add products to favorite",
                  buttonText: 'show more',
                  onPressed: () => Get.to(const NavigationMenu())),
            ),
          ])),
    );
  }
}
