import 'package:auto_size_text/auto_size_text.dart';
import 'dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../../constans/size_config.dart';
import '../../../../themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 70.r,
        right: 20.r,
        left: 20.r,
      ),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          final ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
          return SizedBox(
            width: SizeConfig.screenWidth,
            height: 450.h,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                cubit.onChangePageView(value);
              },
              itemCount: cubit.onBoardingData.length,
              itemBuilder: (context, index) => Column(
                children: [
                  buildTitle(),
                  SizedBox(height: 10.h),
                  buildDescription(cubit, index),
                  SizedBox(height: 20.h),
                  buildImage(cubit, index),
                  SizedBox(height: 20.h),
                  const DotsIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildImage(ShopCubit cubit, int index) {
    return Image.asset(
      cubit.onBoardingData[index]['image']!,
      fit: BoxFit.cover,
      width: 300.w,
    );
  }

  Widget buildDescription(ShopCubit cubit, int index) {
    return AutoSizeText(
      cubit.onBoardingData[index]['text']!,
      style: kHeadLineTwo,
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }

  Widget buildTitle() {
    return AutoSizeText(
      'Medical House Store',
      maxLines: 1,
      style: kHeadLineOneWithPrimaryColor,
    );
  }
}
