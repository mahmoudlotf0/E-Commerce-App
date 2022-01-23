import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildNumberProduct extends StatelessWidget {
  const BuildNumberProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      height: getProportionateScreenHeight(60),
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
                Text(
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
