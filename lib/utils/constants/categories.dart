import 'package:tawfeer/features/create_offer/models/category_model.dart';
import 'package:tawfeer/utils/constants/image_strings.dart';

class TCategories {
  static const categories = [
    Category(
      name: 'Electronics',
      description: 'Phones, computers, gadgets and accessories',
      icon: TImages.electronicsIcon,
    ),
    Category(
      name: 'Furniture',
      description: 'Home and office furniture',
      icon: TImages.furnitureIcon,
    ),
    Category(
      name: 'Fashion',
      description: 'Clothing, shoes, and accessories',
      icon: TImages.clothIcon,
    ),
    Category(
      name: 'Shoes',
      description: 'Footwear of various types and brands',
      icon: TImages.shoeIcon,
    ),
    Category(
      name: 'Cosmetics',
      description: 'Beauty products, makeup, and personal care',
      icon: TImages.cosmeticsIcon,
    ),
    Category(
      name: 'Sports',
      description: 'Sports equipment and fitness gear',
      icon: TImages.sportIcon,
    ),
    Category(
      name: 'Pets',
      description: 'Pet supplies and accessories',
      icon: TImages.animalIcon,
    ),
    Category(
      name: 'Toys',
      description: 'Children’s toys and games',
      icon: TImages.toyIcon,
    ),
    Category(
      name: 'Jewelry',
      description: 'Jewelry and accessories',
      icon: TImages.jeweleryIcon,
    ),
    Category(
      name: 'Other',
      description: 'Other items not fitting above categories',
      icon: TImages.shoeIcon,
    ),
  ];
}
