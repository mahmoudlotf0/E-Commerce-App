import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_route.dart';
import 'businessLogicLayer/bloc_observer.dart';
import 'businessLogicLayer/cubit/shopcubit_cubit.dart';
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
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => BlocProvider(
        create: (ctx) => ShopCubit()..getAllProducts(),
        child: MaterialApp(
          builder: (BuildContext context, Widget? widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: Themes.lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoute.generateRoute,
        ),
      ),
    );
  }
}
