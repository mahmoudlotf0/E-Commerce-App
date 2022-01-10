import 'package:flutter/material.dart';

import '../../../widgets/custom_size_box.dart';
import '../../../widgets/defualt_button.dart';
import '../../login_screen/login_screen.dart';
import 'dots_indicator.dart';
import 'on_boarding_content.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const OnBoardingContent(),
            customSizeBox(height: 10),
            const DotsIndicator(),
            const Spacer(),
            DefualtButton(
              title: 'Continue',
              height: 60,
              onTap: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
