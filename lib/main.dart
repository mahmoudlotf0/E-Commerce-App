import 'package:ecommerceapp/app_route.dart';

import 'themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ShopApp(appRoute: AppRoute()));
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
