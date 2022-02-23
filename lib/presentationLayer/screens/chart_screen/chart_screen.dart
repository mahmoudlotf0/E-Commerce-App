import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartScreen extends StatelessWidget {
  static const String routeName = 'ChartScreen';
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.r,
              vertical: 15.r,
            ),
            child: Center(
              child: Text(
                'Chart Screen',
                style: kHeadLineOneWithPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildArrowBack(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[50],
      ),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
