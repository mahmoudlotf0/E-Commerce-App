import 'package:google_fonts/google_fonts.dart';

import '../constans/constans.dart';
import '../constans/size_config.dart';
import 'package:flutter/material.dart';

TextStyle kBigTitleTextStyle = GoogleFonts.muli(
  textStyle: TextStyle(
    fontSize: getProportionateScreenWidth(36),
    fontWeight: FontWeight.bold,
    color: kPrimaryColor,
  ),
);
TextStyle ktitleTextStyle = GoogleFonts.muli(
  textStyle: TextStyle(
    fontSize: getProportionateScreenWidth(20),
    color: kTextColor,
  ),
);
