part of 'shopcubit_cubit.dart';

@immutable
abstract class ShopState {}

class AppcubitInitial extends ShopState {}

class AppGetDataState extends ShopState {}

class AppDataLoadingState extends ShopState {}

class AppOnBoardingState extends ShopState {}

class AppNumberProductIncreaceState extends ShopState {}

class AppNumberProductDecreaceState extends ShopState {}

class AppNumberProductResetState extends ShopState {}

class AppBottomNavigationBarChangeState extends ShopState {}

class AppAddProductInFavouriteState extends ShopState {}

class AppRemoveProductInFavouriteState extends ShopState {}
