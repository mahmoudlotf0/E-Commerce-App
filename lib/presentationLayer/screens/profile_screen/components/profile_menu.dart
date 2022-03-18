import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuItem extends StatelessWidget {
  final String svgPicture;
  final String title;
  const ProfileMenuItem(
      {required this.svgPicture, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      width: SizeConfig.screenWidth,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgPicture,
            color: kPrimaryColor,
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: AutoSizeText(
              title,
              style: kHeadLineTwo.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
