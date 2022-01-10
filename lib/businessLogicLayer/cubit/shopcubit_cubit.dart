import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/DataLayer/model/product.dart';
import 'package:ecommerceapp/DataLayer/repository/repository.dart';
import 'package:ecommerceapp/DataLayer/web_services/web_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'shopcubit_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(AppcubitInitial());
  static ShopCubit getObjectFromShopCubit(BuildContext context) {
    return BlocProvider.of<ShopCubit>(context);
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

  //* get Data Form Repository
  List<Product> products = [];
  Repository repository = Repository(WebServices());
  Future<List<Product>> getAllProducts() async {
    await repository.getAllProducts().then((value) {
      emit(AppGetDataFromRepository());

      products = value;
    });
    return products;
  }
}
