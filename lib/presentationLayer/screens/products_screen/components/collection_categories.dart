import 'package:flutter/material.dart';

import 'build_category_item.dart';

class CollectionCategories extends StatelessWidget {
  const CollectionCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        BuildCategoryItem(
          imagePath: 'assets/icons/elctric.png',
          lable: 'Electronics',
        ),
        BuildCategoryItem(
          imagePath: 'assets/icons/rings.png',
          lable: 'Jewelery',
        ),
        BuildCategoryItem(
          imagePath: 'assets/icons/shirt.png',
          lable: 'Men\'s clothing',
        ),
        BuildCategoryItem(
          imagePath: 'assets/icons/dress.png',
          lable: 'Women\'s clothing',
        ),
      ],
    );
  }
}
