import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerceapp/presentationLayer/screens/cart_screen/components/check_out_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/themes/text_styles.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        bottomNavigationBar: const CheckOutCard(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.r,
            vertical: 15.r,
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                elevation: 5,
                child: Row(
                  children: [
                    buildImage(cubit),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      //'${cubit.allProducts[0].price.toString()} x2'
                      children: [
                        buildTitle(cubit),
                        buildPriceAndQuantity(cubit),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }

  Widget buildPriceAndQuantity(ShopCubit cubit) {
    return AutoSizeText.rich(
      TextSpan(
        text: cubit.allProducts[0].price.toString(),
        style: kHeadLineThree.copyWith(
          color: kPrimaryColor,
        ),
        children: [
          TextSpan(
            text: '  x5',
            style: kHeadLineThree,
          ),
        ],
      ),
    );
  }

  Widget buildTitle(ShopCubit cubit) {
    return SizedBox(
      width: 190.w,
      height: 40.h,
      child: AutoSizeText(
        cubit.allProducts[0].title,
        style: kHeadLineTwo.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildImage(ShopCubit cubit) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Image.network(
        cubit.allProducts[0].image,
        fit: BoxFit.fill,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: buildArrowBack(context),
      title: Padding(
        padding: EdgeInsets.only(top: 10.0.r),
        child: Column(
          children: [
            AutoSizeText(
              'Your Chart',
              style: kHeadLineTwo.copyWith(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            AutoSizeText(
              '4 items',
              style: kHeadLineTwo,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArrowBack(BuildContext context) {
    return Container(
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
    );
  }
}
