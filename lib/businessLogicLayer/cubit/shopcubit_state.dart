part of 'shopcubit_cubit.dart';

@immutable
abstract class ShopState {}

class AppcubitInitial extends ShopState {}

class AppOnBoardingState extends ShopState {}

class AppNumberProductIncreaceState extends ShopState {}

class AppNumberProductDecreaceState extends ShopState {}

class AppGetDataState extends ShopState {}

class AppBottomNavigationBarChangeState extends ShopState {}

class AppDataLoadingState extends ShopState {}
