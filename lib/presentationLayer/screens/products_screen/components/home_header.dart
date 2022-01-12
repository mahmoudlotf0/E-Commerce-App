import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/build_bell_container.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/build_cart_container.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/search_product.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SearchProduct(),
          BuildCartContainer(),
          BuildBellContainer(),
        ],
      ),
    );
  }
}