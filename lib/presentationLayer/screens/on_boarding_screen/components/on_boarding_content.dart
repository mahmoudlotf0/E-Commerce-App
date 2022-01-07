import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';

import '../../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../../constans/size_config.dart';
import '../../../../themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        final ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
        return Expanded(
          flex: 3,
          child: PageView.builder(
            onPageChanged: (value) {
              cubit.onChangePageView(value);
            },
            itemCount: cubit.onBoardingData.length,
            itemBuilder: (context, index) => Column(
              children: [
                Text(
                  'Medical House Store',
                  style: kHeadLineOne,
                ),
                customSizeBox(height: 10),
                Text(
                  cubit.onBoardingData[index]['text']!,
                  style: kHeadLineTwo,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Image.asset(
                  cubit.onBoardingData[index]['image']!,
                  fit: BoxFit.cover,
                  width: getProportionateScreenWidth(265),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
