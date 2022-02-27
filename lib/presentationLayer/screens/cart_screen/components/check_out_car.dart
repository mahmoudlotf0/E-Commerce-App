import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/presentationLayer/widgets/defualt_button.dart';
import 'package:ecommerceapp/themes/text_styles.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 30.r),
      height: 140.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -12),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildIcon(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPriceTotal(),
              buildButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 70.h,
      child: DefualtButton(
        onTap: () {},
        title: 'Check Out',
      ),
    );
  }

  Widget buildPriceTotal() {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
        double sumPrice = 0;
        for (int i = 0; i < cubit.chartProducts.length; i++) {
          sumPrice = sumPrice +
              (cubit.chartProducts[i].price * cubit.chartProducts[i].quantity);
        }
        return AutoSizeText.rich(
          TextSpan(
            text: 'Total\n',
            style: kHeadLineTwo.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: '\$${num.parse(sumPrice.toStringAsFixed(2))}',
                style: kHeadLineTwo,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildIcon() {
    return Container(
      padding: EdgeInsets.all(10.r),
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset('assets/icons/receipt.svg'),
    );
  }
}
