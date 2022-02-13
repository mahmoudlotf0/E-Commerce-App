import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerceapp/presentationLayer/screens/category_screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildContainerCategory extends StatelessWidget {
  const BuildContainerCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryScreen.routeName);
      },
      child: Container(
        width: double.infinity,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color(0xFF4A4598),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.r,
            vertical: 20.r,
          ),
          child: AutoSizeText(
            'Categories',
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.w,
              ),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
