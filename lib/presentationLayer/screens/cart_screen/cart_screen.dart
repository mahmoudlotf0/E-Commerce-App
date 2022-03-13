import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/presentationLayer/screens/cart_screen/components/check_out_car.dart';
import 'package:ecommerceapp/themes/text_styles.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
        return cubit.chartProducts.isEmpty
            ? buildWidgetWhenNoChart()
            : SafeArea(
                child: Scaffold(
                  appBar: buildAppBar(context, cubit),
                  bottomNavigationBar: const CheckOutCard(),
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.r,
                      vertical: 15.r,
                    ),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        dynamic totalPriceForOneProduct =
                            cubit.chartProducts[index].price *
                                cubit.chartProducts[index].quantity;
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          elevation: 5,
                          child: Row(
                            children: [
                              buildImage(cubit, index),
                              SizedBox(
                                width: 15.w,
                              ),
                              Column(
                                children: [
                                  buildTitle(cubit, index),
                                  buildPriceAndQuantity(
                                      cubit: cubit,
                                      index: index,
                                      totalPrice: totalPriceForOneProduct),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: cubit.chartProducts.length,
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget buildWidgetWhenNoChart() {
    return Scaffold(
      body: Center(
        child: AutoSizeText(
          'No Products',
          style: kHeadLineOneWithPrimaryColor,
        ),
      ),
    );
  }

  Widget buildPriceAndQuantity(
      {required ShopCubit cubit,
      required int index,
      required dynamic totalPrice}) {
    return AutoSizeText.rich(
      TextSpan(
        text: '\$$totalPrice',
        style: kHeadLineThree.copyWith(
          color: kPrimaryColor,
        ),
        children: [
          TextSpan(
            text: '  x${cubit.chartProducts[index].quantity}',
            style: kHeadLineThree,
          ),
        ],
      ),
    );
  }

  Widget buildTitle(ShopCubit cubit, int index) {
    return SizedBox(
      width: 190.w,
      height: 40.h,
      child: AutoSizeText(
        cubit.chartProducts[index].title,
        style: kHeadLineTwo.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildImage(ShopCubit cubit, int index) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Image.network(
        cubit.chartProducts[index].image,
        fit: BoxFit.fill,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, ShopCubit cubit) {
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
              '${cubit.chartProducts.length} items',
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
