import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shopcubit_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopcubitInitial());
  List<Map<String, String>> onBoardingData = [
    {},
    {},
    {},
  ];
}
