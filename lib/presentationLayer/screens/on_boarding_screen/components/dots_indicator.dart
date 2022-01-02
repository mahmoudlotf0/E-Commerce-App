import '../../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../../constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            cubit.onBoardingData.length,
            (int index) => Container(
              margin: const EdgeInsets.only(right: 4),
              height: 6,
              width: cubit.currentPageOfOnBoarding == index ? 20 : 6,
              decoration: BoxDecoration(
                color: cubit.currentPageOfOnBoarding == index
                    ? kPrimaryColor
                    : Colors.grey[350],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        );
      },
    );
  }
}
