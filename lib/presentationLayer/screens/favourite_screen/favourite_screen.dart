import 'package:auto_size_text/auto_size_text.dart';
import '../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../constans/constans.dart';
import '../../../constans/size_config.dart';
import '../../../themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

// * 1- image
// * 2- rating
// * 3- count
// * 4- title
// * 5- category name
// * 6- price

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);

    return cubit.favouriteProducts.isEmpty
        ? Center(
            child: AutoSizeText(
              'No Favourites',
              style: kHeadLineOneWithPrimaryColor,
            ),
          )
        : SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.r,
                    vertical: 15.r,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(context),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {
                          // Todo: Go to special product
                        },
                        child: SizedBox(
                          width: SizeConfig.screenWidth,
                          height: 130.h,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            elevation: 15,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.r,
                              ),
                              child: Row(
                                children: [
                                  // ! image
                                  SizedBox(
                                    width: 100.w,
                                    height: 100.h,
                                    child: Image.network(
                                      cubit.favouriteProducts[0].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // ! Rating and coount
                                      Row(
                                        children: [
                                          SmoothStarRating(
                                            starCount: 5,
                                            rating: 3.6,
                                            allowHalfRating: true,
                                            size: 15.0,
                                            filledIconData: Icons.star,
                                            halfFilledIconData:
                                                Icons.star_border_outlined,
                                            color: kPrimaryColor,
                                            borderColor: kPrimaryColor,
                                            spacing: 0.0,
                                          ),
                                          SizedBox(width: 40.w),
                                          AutoSizeText.rich(
                                            TextSpan(
                                              text: '180',
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
                                          ),
                                        ],
                                      ),
                                      // ! Title
                                      SizedBox(
                                        width: 190.w,
                                        height: 40.h,
                                        child: AutoSizeText(
                                          'ksdjskj hsdhush ksdhsahddd dddd ddddddddd ddddddddd dddddddddd ddddddddd dddddddd ddddddddd ddddddddd ddddddddd',
                                          style: kHeadLineTwo.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      // ! Category name
                                      AutoSizeText(
                                        'Mens Clothes'.toUpperCase(),
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
                                      // ! Price and number product
                                      AutoSizeText(
                                        '\$ 150',
                                        style: kHeadLineTwo.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[50],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kSecondaryColor,
            ),
          ),
        ),
        AutoSizeText(
          'My Favourits',
          style: kHeadLineOneWithPrimaryColor,
          maxLines: 1,
        ),
        GestureDetector(
          onTap: () {
            // TODO: Go To Cart Screen
          },
          child: Container(
            width: 46.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: SvgPicture.asset('assets/icons/Cart Icon.svg'),
            ),
          ),
        ),
      ],
    );
  }
}
