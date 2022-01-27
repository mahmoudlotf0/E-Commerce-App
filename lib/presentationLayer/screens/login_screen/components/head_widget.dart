import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../themes/text_styles.dart';
import 'package:flutter/material.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          'Welcome Back',
          style: kHeadLine,
          maxLines: 1,
        ),
        SizedBox(height: 8.h),
        AutoSizeText(
          'Sign in with your email and password\nor continue with soial media',
          maxLines: 3,
          style: kHeadLineThree,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
