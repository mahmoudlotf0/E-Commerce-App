import 'package:ecommerceapp/constans/size_config.dart';
import 'package:flutter/cupertino.dart';

SizedBox customSizeBox({double height = 0, double width = 0}) {
  return SizedBox(
    height: getProportionateScreenHeight(height),
    width: getProportionateScreenWidth(width),
  );
}
