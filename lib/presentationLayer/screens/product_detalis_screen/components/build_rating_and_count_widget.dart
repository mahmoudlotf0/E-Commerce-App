import 'package:ecommerceapp/DataLayer/model/product.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class BuildRatingAndCountWidget extends StatelessWidget {
  final Product product;
  const BuildRatingAndCountWidget({required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customSizeBox(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SmoothStarRating(
            starCount: 5,
            rating: product.rating['rate'],
            allowHalfRating: true,
            size: 20.0,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_border_outlined,
            color: kPrimaryColor,
            borderColor: kPrimaryColor,
            spacing: 0.0,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: product.rating['count'].toString(),
                  style: kHeadLineThree.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
                TextSpan(
                  text: ' Count',
                  style: kHeadLineThree,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
