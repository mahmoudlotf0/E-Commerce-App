import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/businessLogicLayer/bloc_observer.dart';

import 'app_route.dart';

import 'themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(
        ShopApp(appRoute: AppRoute()),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class ShopApp extends StatelessWidget {
  final AppRoute appRoute;
  const ShopApp({required this.appRoute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
