import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:ecommerceapp/businessLogicLayer/bloc_observer.dart';
import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_route.dart';
import 'themes/themes.dart';

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
    return BlocProvider(
      create: (_) => ShopCubit(),
      child: MaterialApp(
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.generateRoute,
      ),
    );
  }
}
