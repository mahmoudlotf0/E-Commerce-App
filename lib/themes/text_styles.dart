import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constans/constans.dart';
import '../constans/size_config.dart';

TextStyle kHeadLine = GoogleFonts.muli(
  textStyle: TextStyle(
    fontSize: getProportionateScreenHeight(40),
    fontWeight: FontWeight.bold,
  ),
);

TextStyle kHeadLineOneWithPrimaryColor = GoogleFonts.muli(
  textStyle: TextStyle(
    fontSize: getProportionateScreenWidth(36),
    fontWeight: FontWeight.bold,
    color: kPrimaryColor,
  ),
);
TextStyle kHeadLineTwo = GoogleFonts.muli(
  textStyle: TextStyle(
    fontSize: getProportionateScreenWidth(20),
    color: kTextColor,
  ),
);
TextStyle kHeadLineThree = GoogleFonts.muli(
  textStyle: TextStyle(
    fontSize: getProportionateScreenWidth(14),
    color: kTextColor,
    fontWeight: FontWeight.bold,
  ),
);
TextStyle kHeadLineThreeWithPrimaryColor = GoogleFonts.muli(
  textStyle: TextStyle(
    fontSize: getProportionateScreenWidth(14),
    color: kPrimaryColor,
  ),
);
TextStyle kHeadLineFour = GoogleFonts.muli(
  textStyle: TextStyle(
    fontSize: getProportionateScreenWidth(14),
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
);
