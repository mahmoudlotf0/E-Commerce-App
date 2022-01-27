import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import '../../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../../constans/constans.dart';
import '../../../../constans/size_config.dart';
import '../../product_detalis_screen/product_details_screen.dart';
import '../../../widgets/cirular_indecator_widget.dart';
import '../../../../themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialProduct extends StatelessWidget {
  final ShopCubit cubit;
  const SpecialProduct({required this.cubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cubit.allProducts.isEmpty
        ? const CircularIndecatorWidget()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Special for you',
                maxLines: 1,
                style: kHeadLineTwo.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: SizeConfig.screenWidth,
                height: 110.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Random random = Random();
                    index = random.nextInt(19);
                    return index <= 19
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ProductDetailsScreen.routeName,
                                arguments: cubit.allProducts[index],
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 20.r,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  cubit.allProducts[index].image.isNotEmpty
                                      ? buildImageProduct(index)
                                      : Image.asset('assets/icons/loading.gif'),
                                  buildTitle(index),
                                ],
                              ),
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

  SizedBox buildTitle(int index) {
    return SizedBox(
      width: 80.w,
      height: 15.h,
      child: AutoSizeText(
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
    );
  }

  FadeInImage buildImageProduct(int index) {
    return FadeInImage.assetNetwork(
      width: 100.w,
      height: 90.h,
      fit: BoxFit.fill,
      placeholder: 'assets/icons/loading.gif',
      image: cubit.allProducts[index].image,
    );
  }
}
