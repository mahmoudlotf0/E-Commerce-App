import 'package:auto_size_text/auto_size_text.dart';
import '../../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../../constans/size_config.dart';
import '../../../../themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildNumberProduct extends StatelessWidget {
  const BuildNumberProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
      ),
      height: 55.h,
      width: SizeConfig.screenWidth,
      child: BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {},
          builder: (context, state) {
            ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCircleButton(
                  cubit: cubit,
                  function: () {
                    if (cubit.numberProduct > 0) {
                      cubit.decreaseNumberProduct();
                    }
                  },
                  icon: Icons.remove,
                ),
                AutoSizeText(
                  cubit.numberProduct.toString(),
                  style: kHeadLineOneWithPrimaryColor,
                ),
                buildCircleButton(
                  cubit: cubit,
                  function: () {
                    cubit.increaseNumberProduct();
                  },
                  icon: Icons.add,
                ),
              ],
            );
          }),
    );
  }

  Widget buildCircleButton({
    required ShopCubit cubit,
    required Function() function,
    required IconData icon,
  }) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: const CircleBorder(),
        elevation: 10,
      ),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
