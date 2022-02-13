import 'package:ecommerceapp/presentationLayer/screens/category_details_screen/category_details_screen.dart';
import 'package:ecommerceapp/presentationLayer/screens/category_screen/category_screen.dart';
import 'package:flutter/material.dart';

import 'DataLayer/model/product.dart';
import 'presentationLayer/screens/login_screen/login_screen.dart';
import 'presentationLayer/screens/on_boarding_screen/on_boarding_screen.dart';
import 'presentationLayer/screens/product_detalis_screen/product_details_screen.dart';
import 'presentationLayer/screens/products_screen/products_screen.dart';
import 'presentationLayer/screens/register_Screen/register_screen.dart';

class AppRoute {
  // ShopCubit cubit = ShopCubit();
  // AppRoute() {
  //   cubit.getAllProducts();
  // }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ProductsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
      case ProductDetailsScreen.routeName:
        final Product product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
        );
      case CategoryScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      case CategoryDetailsscreen.routeName:
        final String title = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => CategoryDetailsscreen(
                  title: title,
                ));
    }
  }
}
