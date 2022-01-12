import 'package:ecommerceapp/constans/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildBellContainer extends StatelessWidget {
  const BuildBellContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: getProportionateScreenWidth(46),
          height: getProportionateScreenWidth(46),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            child: SvgPicture.asset(
              'assets/icons/Bell.svg',
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: getProportionateScreenWidth(15),
            height: getProportionateScreenHeight(15),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '3',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
