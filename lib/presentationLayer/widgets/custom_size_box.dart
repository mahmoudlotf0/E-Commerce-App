import '../../constans/size_config.dart';
import 'package:flutter/cupertino.dart';

SizedBox customSizeBox({double height = 0, double width = 0, Widget? child}) {
  return SizedBox(
    height: getProportionateScreenHeight(height),
    width: getProportionateScreenWidth(width),
    child: child,
  );
}
