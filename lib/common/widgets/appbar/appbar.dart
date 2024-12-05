import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/sizes.dart';
import 'package:tawfeer/utils/device/device_utility.dart';
import 'package:tawfeer/utils/helpers/helper_functions.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.loadingOnPressed,
      this.centerTitle = false,
      this.bottomWidget});

  final Widget? title;
  final bool showBackArrow;
  final bool centerTitle;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? loadingOnPressed;
  final PreferredSizeWidget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        centerTitle: centerTitle,
        automaticallyImplyLeading: false,
        title: title,
        actions: actions,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.light
                      : TColors.dark,
                ))
            : leadingIcon != null
                ? IconButton(
                    onPressed: loadingOnPressed, icon: Icon(leadingIcon))
                : null,
        bottom: bottomWidget,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight() +
      (bottomWidget?.preferredSize.height ?? 0));
}
