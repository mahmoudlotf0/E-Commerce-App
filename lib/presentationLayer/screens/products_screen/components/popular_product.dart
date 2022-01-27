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
import 'package:like_button/like_button.dart';

class PopularProduct extends StatelessWidget {
  final ShopCubit cubit;
  const PopularProduct({required this.cubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cubit.allProducts.isEmpty
        ? const CircularIndecatorWidget()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Popular Product',
                style: kHeadLineTwo.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: SizeConfig.screenWidth,
                height: 160.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // TODO: Sort List of height count
                    return GestureDetector(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildImage(index),
                            buildTitle(index),
                            buildCategoryName(index),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildPrice(index),
                                buildLikeButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
            ],
          );
  }

  Widget buildImage(int index) {
    return Container(
      width: 140.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: EdgeInsets.all(
          15.r,
        ),
        child: cubit.allProducts[index].image.isNotEmpty
            ? FadeInImage.assetNetwork(
                fit: BoxFit.fill,
                placeholder: 'assets/icons/loading.gif',
                image: cubit.allProducts[index].image,
              )
            : Image.asset('assets/icons/loading.gif'),
      ),
    );
  }

  Widget buildTitle(int index) {
    return SizedBox(
      width: 140.w,
      height: 18.h,
      child: AutoSizeText(
        cubit.allProducts[index].title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.muli(
          textStyle: const TextStyle(
            fontSize: 15.0,
            color: kTextColor,
          ),
        ),
      ),
    );
  }

  Widget buildCategoryName(int index) {
    return SizedBox(
      width: 140.w,
      height: 18.h,
      child: AutoSizeText(
        cubit.allProducts[index].category.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.muli(
          textStyle: const TextStyle(
            fontSize: 15.0,
            color: kTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildPrice(int index) {
    return SizedBox(
      width: 120.w,
      height: 18.h,
      child: AutoSizeText(
        '\$${cubit.allProducts[index].price}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.muli(
          textStyle: const TextStyle(
            fontSize: 20.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildLikeButton() {
    return LikeButton(
      size: 20.w,
      // TODO: When tap go to favotite list
    );
  }
}
