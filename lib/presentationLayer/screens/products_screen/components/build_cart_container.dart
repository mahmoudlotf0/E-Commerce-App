import 'package:ecommerceapp/constans/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildCartContainer extends StatelessWidget {
  const BuildCartContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Go To Cart Screen
      },
      child: Container(
        width: getProportionateScreenWidth(46),
        height: getProportionateScreenWidth(46),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(12)),
          child: SvgPicture.asset('assets/icons/Cart Icon.svg'),
        ),
      ),
    );
  }
}
