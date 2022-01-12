import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCategoryItem extends StatelessWidget {
  final String imagePath;
  final String lable;
  const BuildCategoryItem(
      {required this.imagePath, required this.lable, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Go To Particulare Category
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(80),
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
                vertical: getProportionateScreenHeight(15),
              ),
              child: Image.asset(imagePath),
            ),
          ),
          Text(
            lable,
            style: GoogleFonts.muli(
              textStyle: kHeadLineThree,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
