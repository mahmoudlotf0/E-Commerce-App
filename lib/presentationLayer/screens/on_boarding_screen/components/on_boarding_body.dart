import 'package:ecommerceapp/presentationLayer/screens/on_boarding_screen/components/dots_indicator.dart';
import 'package:ecommerceapp/presentationLayer/screens/on_boarding_screen/components/on_boarding_content.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Spacer(),
            OnBoardingContent(),
            DotsIndicator(),
          ],
        ),
      ),
    );
  }
}
