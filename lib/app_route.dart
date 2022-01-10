import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/products_screen.dart';
import 'package:ecommerceapp/presentationLayer/screens/register_Screen/register_screen.dart';
import 'package:flutter/material.dart';

import 'presentationLayer/screens/login_screen/login_screen.dart';
import 'presentationLayer/screens/on_boarding_screen/on_boarding_screen.dart';

class AppRoute {
  ShopCubit cubit = ShopCubit();
  AppRoute() {
    cubit.getAllProducts();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ProductsScreen.routeName:
        return MaterialPageRoute(builder: (_) => ProductsScreen(cubit: cubit));
    }
  }
}
