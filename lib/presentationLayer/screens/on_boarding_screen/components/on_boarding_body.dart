import 'package:ecommerceapp/presentationLayer/screens/products_screen/products_screen.dart';

import '../../../../constans/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/defualt_button.dart';
import '../../login_screen/login_screen.dart';
import 'on_boarding_content.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const OnBoardingContent(),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildButton(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: DefualtButton(
        title: 'Continue',
        height: 60.h,
        onTap: () {
          Navigator.of(context).pushNamed(ProductsScreen.routeName);
        },
      ),
    );
  }
}
