import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/presentationLayer/screens/category_details_screen/category_details_screen.dart';
import '../../../../themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCategoryItem extends StatelessWidget {
  final String imagePath;
  final String lable;
  const BuildCategoryItem({
    required this.imagePath,
    required this.lable,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5.r),
          height: 60.h,
          width: 70.w,
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.r,
              vertical: 15.r,
            ),
            child: buildIcone(),
          ),
        ),
        buildTitleOfIcon(),
      ],
    );
  }

  Widget buildTitleOfIcon() {
    return AutoSizeText(
      lable,
      style: GoogleFonts.muli(
        textStyle: kHeadLineThree,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }

  Image buildIcone() {
    return Image.asset(
      imagePath,
      fit: BoxFit.fill,
    );
  }
}
