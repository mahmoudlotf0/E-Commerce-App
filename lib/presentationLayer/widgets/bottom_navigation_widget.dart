import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationWidget extends StatelessWidget {
  final ShopCubit cubit;
  const BottomNavigationWidget({required this.cubit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: cubit.currentIndex,
      onTap: (index) {
        cubit.onTapBottomNavigationBar(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Shop Icon.svg',
            color: cubit.currentIndex == 0 ? kPrimaryColor : kSecondaryColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Heart Icon.svg',
            color: cubit.currentIndex == 1 ? kPrimaryColor : kSecondaryColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/User Icon.svg',
            color: cubit.currentIndex == 2 ? kPrimaryColor : kSecondaryColor,
          ),
          label: '',
        ),
      ],
    );
  }
}
