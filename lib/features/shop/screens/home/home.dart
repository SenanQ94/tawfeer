import 'package:flutter/material.dart';
import 'package:tawfeer/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:tawfeer/common/widgets/layouts/grid_layout.dart';
import 'package:tawfeer/common/widgets/products/product_card_vertical.dart';
import 'package:tawfeer/common/widgets/texts/section_heading.dart';
import 'package:tawfeer/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:tawfeer/features/shop/screens/home/widgets/home_categories.dart';
import 'package:tawfeer/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:tawfeer/utils/constants/colors.dart';
import 'package:tawfeer/utils/constants/image_strings.dart';
import 'package:tawfeer/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: 250,
            collapsedHeight: 80,

            flexibleSpace: TPrimaryHeaderContainer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections / 2),
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          TSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: TColors.white,
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),
                          THomeCategories(),
                          SizedBox(height: TSizes.spaceBtwSections),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //title: const THomeAppBar(), // Use your existing app bar widget
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: TSizes.xs,
                    horizontal: TSizes.defaultSpace,
                  ),
                  child: Column(
                    children: [
                      const TSectionHeading(
                        title: 'For You',
                        showActionButton: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TPromoSlider(banners: [
                        TImages.promoBanner2,
                        TImages.promoBanner1,
                        TImages.promoBanner3,
                      ]),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      const TSectionHeading(
                        title: 'Nearby',
                        showActionButton: false,
                      ),
                      TGridLayout(
                        itemCount: 3,
                        itemBuilder: (_, index) => const TProductCardVertical(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
