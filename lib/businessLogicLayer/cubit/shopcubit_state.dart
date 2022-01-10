part of 'shopcubit_cubit.dart';

@immutable
abstract class ShopState {}

class AppcubitInitial extends ShopState {}

class AppPageViewState extends ShopState {}

class AppGetDataFromRepository extends ShopState {}

class AppLoginLoadingState extends ShopState {}

class AppLoginSuccessState extends ShopState {}

class AppLoginErrorState extends ShopState {
  final String error;
  AppLoginErrorState(this.error);
}
