import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/build_category_item.dart';
import 'package:flutter/material.dart';

class CollectionCategories extends StatelessWidget {
  const CollectionCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        BuildCategoryItem(
          imagePath: 'assets/icons/elctric.png',
          lable: 'Electronics\n',
        ),
        BuildCategoryItem(
          imagePath: 'assets/icons/rings.png',
          lable: 'Jewelery\n',
        ),
        BuildCategoryItem(
          imagePath: 'assets/icons/shirt.png',
          lable: 'Men\'s \nclothing',
        ),
        BuildCategoryItem(
          imagePath: 'assets/icons/dress.png',
          lable: 'Women\'s \nclothing',
        ),
      ],
    );
  }
}
