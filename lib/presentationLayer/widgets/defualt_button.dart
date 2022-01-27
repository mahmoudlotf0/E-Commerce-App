import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constans/constans.dart';
import '../../constans/size_config.dart';

class DefualtButton extends StatelessWidget {
  final String title;
  final double? height;
  final Function()? onTap;
  const DefualtButton({
    required this.onTap,
    required this.title,
    this.height = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.r, horizontal: 30.r),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
            primary: kPrimaryColor,
          ),
          child: Text(
            title,
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                color: kPrimaryLightColor,
              ),
            ),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
