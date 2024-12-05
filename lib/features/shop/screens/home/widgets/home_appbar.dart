import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tawfeer/common/widgets/appbar/appbar.dart';
import 'package:tawfeer/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:tawfeer/common/widgets/products/cart_menu_icon.dart';
import 'package:tawfeer/utils/constants/colors.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: const TSearchContainer(
        text: 'Search in Store',
        padding: EdgeInsets.all(0),
      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       TTexts.homeAppbarTitle,
      //       style: Theme.of(context)
      //           .textTheme
      //           .labelMedium!
      //           .apply(color: TColors.grey),
      //     ),
      //     Text(
      //       TTexts.homeAppbarSubTitle,
      //       style: Theme.of(context)
      //           .textTheme
      //           .headlineSmall!
      //           .apply(color: TColors.white),
      //     )
      //   ],
      // ),
      actions: [
        TCountCounterIcon(
          icon: Iconsax.notification,
          iconColor: TColors.white,
          counter: '4',
          onPressed: () {},
        )
      ],
    );
  }
}
