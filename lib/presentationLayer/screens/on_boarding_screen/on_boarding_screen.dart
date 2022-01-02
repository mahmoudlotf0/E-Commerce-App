import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/screens/on_boarding_screen/components/body_on_boarding_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BodyOnBoardingScreen(),
    );
  }
}
