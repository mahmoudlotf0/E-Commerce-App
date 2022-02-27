import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerceapp/presentationLayer/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import 'package:ecommerceapp/presentationLayer/screens/product_detalis_screen/product_details_screen.dart';

import '../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../constans/constans.dart';
import '../../../themes/text_styles.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ShopCubit cubit;

    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        cubit = ShopCubit.getObjectFromShopCubit(context);
        return cubit.favouriteProducts.isEmpty
            ? buildWidgetWhenNoFavourite()
            : SafeArea(
                child: Scaffold(
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: buildMainPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(context),
                          SizedBox(height: 25.h),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                buildCardItem(cubit, index, context),
                            itemCount: cubit.favouriteProducts.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget buildCardItem(ShopCubit cubit, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        int productId = cubit.favouriteProducts[index].id - 1;
        print(productId);
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: cubit.allProducts[productId],
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.r,
          ),
          child: buildCardContent(cubit, index),
        ),
      ),
    );
  }

  Widget buildCardContent(ShopCubit cubit, int index) {
    return Row(
      children: [
        buildImage(cubit: cubit, index: index),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                buildRating(cubit, index),
                SizedBox(width: 40.w),
                buildCount(cubit, index),
              ],
            ),
            buildTitle(cubit, index),
            buildCategoryName(cubit, index),
            buildPrice(cubit, index),
          ],
        ),
      ],
    );
  }

  Widget buildMainPadding({required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.r,
        vertical: 15.r,
      ),
      child: child,
    );
  }

  Widget buildWidgetWhenNoFavourite() {
    return Center(
      child: AutoSizeText(
        'No Favourites',
        style: kHeadLineOneWithPrimaryColor,
      ),
    );
  }

  Widget buildPrice(ShopCubit cubit, int index) {
    return AutoSizeText(
      '\$${cubit.favouriteProducts[index].price.toString()}',
      style: kHeadLineTwo.copyWith(
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
    );
  }

  Widget buildCategoryName(ShopCubit cubit, int index) {
    return AutoSizeText(
      cubit.favouriteProducts[index].category.toUpperCase(),
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
    );
  }

  Widget buildTitle(ShopCubit cubit, int index) {
    return SizedBox(
      width: 190.w,
      height: 40.h,
      child: AutoSizeText(
        cubit.favouriteProducts[index].title.toString(),
        style: kHeadLineTwo.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildCount(ShopCubit cubit, int index) {
    return AutoSizeText.rich(
      TextSpan(
        text: cubit.favouriteProducts[index].rating['count'].toString(),
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

  Widget buildRating(ShopCubit cubit, int index) {
    return SmoothStarRating(
      starCount: 5,
      rating: cubit.favouriteProducts[index].rating['rate'] + 0.0,
      allowHalfRating: true,
      size: 15.0,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star_border_outlined,
      color: kPrimaryColor,
      borderColor: kPrimaryColor,
      spacing: 0.0,
    );
  }

  Widget buildImage({required ShopCubit cubit, required int index}) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Image.network(
        cubit.favouriteProducts[index].image,
        fit: BoxFit.fill,
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
            Navigator.of(context).pushNamed(CartScreen.routeName);
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
