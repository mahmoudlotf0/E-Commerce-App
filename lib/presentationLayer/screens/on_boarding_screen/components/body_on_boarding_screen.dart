import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/themes/text_themes.dart';
import 'package:flutter/material.dart';

class BodyOnBoardingScreen extends StatelessWidget {
  const BodyOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  'Medical House Store',
                  style: kBigTitleTextStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome to Medical House store',
                  style: ktitleTextStyle,
                ),
                Image.asset(
                  'assets/images/splash_1.png',
                  height: getProportionateScreenHeight(265),
                  width: getProportionateScreenWidth(235),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
