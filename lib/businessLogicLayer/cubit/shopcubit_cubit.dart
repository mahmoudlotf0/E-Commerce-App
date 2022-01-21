import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../DataLayer/model/product.dart';
import '../../DataLayer/repository/repository.dart';

part 'shopcubit_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(AppcubitInitial());
  static ShopCubit getObjectFromShopCubit(BuildContext context) {
    return BlocProvider.of<ShopCubit>(context);
  }

  // * bottom navigation bar
  int currentIndex = 0;
  void onTapBottomNavigationBar(int index) {
    currentIndex = index;
    emit(AppBottomNavigationBarChangeState());
  }

  // * On Boarding Screen
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

  //* get all Product from API
  List<Product> allProducts = [];
  List<Product> getAllProducts() {
    emit(AppDataLoadingState());
    Repository repository = Repository();
    repository.getAllProducts().then((value) {
      allProducts = value;
      emit(AppGetDataState());
    }).catchError((error) {
      print(error.toString());
    });
    return allProducts;
  }
}
