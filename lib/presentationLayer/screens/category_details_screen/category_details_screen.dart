import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import 'package:ecommerceapp/DataLayer/model/product.dart';
import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/presentationLayer/screens/product_detalis_screen/product_details_screen.dart';
import 'package:ecommerceapp/themes/text_styles.dart';

class CategoryDetailsscreen extends StatelessWidget {
  static const String routeName = 'CategoryDetailsScreen';
  final String title;
  const CategoryDetailsscreen({required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
    List<Product> products = cubit.allProducts.where(
      (Product element) {
        return element.category.contains(title.toLowerCase());
      },
    ).toList();
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.r,
            vertical: 15.r,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  int productId = products[index].id - 1;
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
                  elevation: 15,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.r,
                    ),
                    child: Row(
                      children: [
                        buildImage(products, index),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                buildRating(products, index),
                                SizedBox(width: 40.w),
                                buildCount(products, index),
                              ],
                            ),
                            buildTitle(products, index),
                            buildCategoryName(products, index),
                            buildPrice(products, index),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: title == 'Men\'s clothing' ? 4 : products.length,
          ),
        ),
      ),
    );
  }

  Widget buildPrice(List<Product> products, int index) {
    return AutoSizeText(
      '\$${products[index].price.toString()}',
      style: kHeadLineTwo.copyWith(
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
    );
  }

  Widget buildCategoryName(List<Product> products, int index) {
    return AutoSizeText(
      products[index].category.toUpperCase(),
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

  Widget buildTitle(List<Product> products, int index) {
    return SizedBox(
      width: 190.w,
      height: 40.h,
      child: AutoSizeText(
        products[index].title.toString(),
        style: kHeadLineTwo.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildCount(List<Product> products, int index) {
    return AutoSizeText.rich(
      TextSpan(
        text: products[index].rating['count'].toString(),
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

  Widget buildRating(List<Product> products, int index) {
    return SmoothStarRating(
      starCount: 5,
      rating: products[index].rating['rate'] + 0.0,
      allowHalfRating: true,
      size: 15.0,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star_border_outlined,
      color: kPrimaryColor,
      borderColor: kPrimaryColor,
      spacing: 0.0,
    );
  }

  Widget buildImage(List<Product> products, int index) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Image.network(
        products[index].image,
        fit: BoxFit.fill,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        title,
        style: kHeadLineOneWithPrimaryColor,
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: Container(
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
    );
  }
}
