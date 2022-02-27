import 'package:ecommerceapp/presentationLayer/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildCartContainer extends StatelessWidget {
  const BuildCartContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CartScreen.routeName);
      },
      child: Container(
        width: 46.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: SvgPicture.asset('assets/icons/Cart Icon.svg'),
        ),
      ),
    );
  }
}
