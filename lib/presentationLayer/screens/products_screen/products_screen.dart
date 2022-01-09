import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = 'ProductsScreen';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Product Screen'),
    );
  }
}
