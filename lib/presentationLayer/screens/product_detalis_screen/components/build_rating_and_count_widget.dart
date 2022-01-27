import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../DataLayer/model/product.dart';
import '../../../../constans/constans.dart';
import '../../../../constans/size_config.dart';
import '../../../../themes/text_styles.dart';

class BuildRatingAndCountWidget extends StatelessWidget {
  final Product product;
  const BuildRatingAndCountWidget({required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.04,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildRating(),
          buildPrice(),
          buildCountNumber(),
        ],
      ),
    );
  }

  Widget buildPrice() {
    return AutoSizeText(
      '\$${product.price.toString()}',
      style: kHeadLineTwo.copyWith(
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
    );
  }

  Widget buildRating() {
    return SmoothStarRating(
      starCount: 5,
      rating: product.rating['rate'] + 0.0,
      allowHalfRating: true,
      size: 20.0.w,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star_border_outlined,
      color: kPrimaryColor,
      borderColor: kPrimaryColor,
      spacing: 0.0,
    );
  }

  Widget buildCountNumber() {
    return AutoSizeText.rich(
      TextSpan(
        text: product.rating['count'].toString(),
        style: kHeadLineThree.copyWith(
          color: kPrimaryColor,
        ),
        children: [
          TextSpan(
            text: ' Count',
            style: kHeadLineThree,
          ),
        ],
      ),
    );
  }
}
