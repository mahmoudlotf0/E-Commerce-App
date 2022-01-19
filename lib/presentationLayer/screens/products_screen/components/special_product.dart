import 'dart:math';

import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialProduct extends StatelessWidget {
  final ShopCubit cubit;
  const SpecialProduct({required this.cubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Special for you',
          style: kHeadLineTwo.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        customSizeBox(height: 20),
        customSizeBox(
          width: SizeConfig.screenWidth,
          height: getProportionateScreenHeight(120),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Random random = Random();
              index = random.nextInt(19);
              return index <= 19
                  ? Padding(
                      padding: EdgeInsets.only(
                        right: getProportionateScreenWidth(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            cubit.allProducts[index].image,
                            fit: BoxFit.fill,
                            height: getProportionateScreenHeight(100),
                            width: getProportionateScreenWidth(100),
                          ),
                          customSizeBox(
                            width: SizeConfig.screenWidth * 0.30,
                            height: getProportionateScreenHeight(20),
                            child: Text(
                              cubit.allProducts[index].title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.muli(
                                textStyle: const TextStyle(
                                  fontSize: 15.0,
                                  color: kTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container();
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
