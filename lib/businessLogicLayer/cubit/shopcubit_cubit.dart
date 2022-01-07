import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'shopcubit_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(AppcubitInitial());
  static ShopCubit getObjectFromShopCubit(BuildContext context) {
    return BlocProvider.of<ShopCubit>(context);
  }
  // * On Boarding Data
  int currentPageOfOnBoarding = 0;
  List<Map<String, String>> onBoardingData = [
    {
      "text": "Welcome to Medical House Store.",
      "image": "assets/images/splash_1.png",
    },
    {
      "text": "We help people connect with store \naround Egypt.",
      "image": "assets/images/splash_2.png",
    },
    {
      "text": "We show the easy way to shop.\nJust stay at home with us.",
      "image": "assets/images/splash_3.png",
    },
  ];
  void onChangePageView(int value) {
    currentPageOfOnBoarding = value;
    emit(AppPageViewState());
  }
}
