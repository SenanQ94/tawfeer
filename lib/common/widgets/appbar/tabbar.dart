import 'package:flutter/material.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/device/device_utility.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs,
      isScrollable: false,
      indicatorColor: TColors.primary,
      unselectedLabelColor: TColors.darkGrey,
      labelColor: THelperFunctions.isDarkMode(context)
          ? TColors.white
          : TColors.primary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
