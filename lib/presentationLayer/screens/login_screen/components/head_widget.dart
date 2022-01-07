import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back',
          style: kHeadLine,
        ),
        customSizeBox(height: 8),
        Text(
          'Sign in with your email and password\nor continue with soial media',
          style: kHeadLineThree,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
