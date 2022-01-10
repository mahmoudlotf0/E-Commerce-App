import 'package:ecommerceapp/DataLayer/repository/repository.dart';
import 'package:ecommerceapp/DataLayer/web_services/web_services.dart';
import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/products_screen.dart';
import 'package:ecommerceapp/presentationLayer/screens/register_Screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentationLayer/screens/login_screen/login_screen.dart';
import 'presentationLayer/screens/on_boarding_screen/on_boarding_screen.dart';

class AppRoute {
  ShopCubit shopCubit;
  AppRoute(this.shopCubit) {
    WebServices webServices = WebServices();
    Repository repository = Repository(webServices);
    repository.getAllProducts();
    print('Data is Done ----------------------------');
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => shopCubit,
            child: const OnBoardingScreen(),
          ),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ProductsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => shopCubit,
            child: const ProductsScreen(),
          ),
        );
    }
  }
}
