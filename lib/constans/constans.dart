import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFFCDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kSecondaryColor = Color(0xff979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(microseconds: 500);
void navigatorTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return widget;
  }));
}

void navigatorAndFinish(BuildContext context, Widget widget) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    return widget;
  }));
}
