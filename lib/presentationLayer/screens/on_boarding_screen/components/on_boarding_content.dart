import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Text(
            'Medical House Store',
            style: kBigTitleTextStyle,
          ),
          const SizedBox(height: 10),
          Text(
            'Welcome to Medical House Store',
            style: ktitleTextStyle,
          ),
          const Spacer(),
          Image.asset(
            'assets/images/splash_1.png',
            fit: BoxFit.cover,
            width: getProportionateScreenWidth(265),
          ),
        ],
      ),
    );
  }
}
