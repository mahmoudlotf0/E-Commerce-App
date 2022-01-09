import 'package:ecommerceapp/DataLayer/web_services/web_services.dart';
import 'package:ecommerceapp/presentationLayer/screens/register_Screen/register_screen.dart';
import 'package:flutter/material.dart';

import 'presentationLayer/screens/login_screen/login_screen.dart';
import 'presentationLayer/screens/on_boarding_screen/on_boarding_screen.dart';

class AppRoute {
  List<dynamic> testList = [];
  WebServices webServices = WebServices();
  AppRoute() {
    WebServices.initDio();
    webServices.getAllProducts().then((value) {
      testList = value;
      print('-------------------- $testList');
    });
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
    }
  }
}
