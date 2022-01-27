import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildBellContainer extends StatelessWidget {
  const BuildBellContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildIcon(),
        buildTextUponIcon(),
      ],
    );
  }

  Widget buildTextUponIcon() {
    return Positioned(
      right: 0,
      child: Container(
        width: 15.w,
        height: 14.h,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: const AutoSizeText(
          '3',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Container(
      width: 46.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: SvgPicture.asset(
          'assets/icons/Bell.svg',
        ),
      ),
    );
  }
}
