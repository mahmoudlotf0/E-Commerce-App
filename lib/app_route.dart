import 'package:ecommerceapp/presentationLayer/screens/login_screen/login_screen.dart';
import 'package:ecommerceapp/presentationLayer/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
