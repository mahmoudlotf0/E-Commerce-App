import 'dots_indicator.dart';
import 'on_boarding_content.dart';
import '../../../widgets/defualt_button.dart';
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
            SizedBox(height: 10),
            DotsIndicator(),
            Spacer(),
            DefualtButton(),
          ],
        ),
      ),
    );
  }
}
