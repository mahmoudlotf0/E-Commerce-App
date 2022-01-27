import 'build_bell_container.dart';
import 'build_cart_container.dart';
import 'search_product.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SearchProduct(),
        BuildCartContainer(),
        BuildBellContainer(),
      ],
    );
  }
}
