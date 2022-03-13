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

  //* bottom navigation bar
  int currentIndex = 0;
  void onTapBottomNavigationBar(int index) {
    currentIndex = index;
    emit(AppBottomNavigationBarChangeState());
  }

  //* On Boarding Screen
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
    emit(AppOnBoardingState());
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

  //* Number Product
  int numberProduct = 1;
  void increaseNumberProduct() {
    numberProduct++;
    emit(AppNumberProductIncreaceState());
  }

  void decreaseNumberProduct() {
    numberProduct--;
    emit(AppNumberProductDecreaceState());
  }

  void resetNumberProduct() {
    numberProduct = 1;
    emit(AppNumberProductResetState());
  }

  //* Favoutite Screen
  List<Product> favouriteProducts = [];
  List<String> prefsProductId = [];
  void addOrRemoveProuductFromFavourites(int productId) {
    final int exsitingIndex =
        favouriteProducts.indexWhere((product) => product.id == productId);
    if (exsitingIndex >= 0) {
      favouriteProducts.removeAt(exsitingIndex);
      emit(AppRemoveProductInFavouriteState());
    } else {
      favouriteProducts
          .add(allProducts.firstWhere((product) => product.id == productId));
      emit(AppAddProductInFavouriteState());
    }
  }

  bool isProductFavourite(int productId) {
    return favouriteProducts.any((product) => product.id == productId);
  }

  //* Chart Screen
  List<Product> chartProducts = [];
  void addOrRemoveProuductFromChart(int productId) {
    final exsitingIndex =
        // ignore: unrelated_type_equality_checks
        chartProducts.indexWhere((product) => product.id == productId);
    if (exsitingIndex >= 0) {
    } else {
      chartProducts
          // ignore: unrelated_type_equality_checks
          .add(allProducts.firstWhere((product) => product.id == productId));
      emit(AppAddProductInChartState());
    }
  }
}
