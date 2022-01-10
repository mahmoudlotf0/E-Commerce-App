import 'package:dio/dio.dart';
import 'package:ecommerceapp/constans/constans.dart';

class WebServices {
  late Dio dio;
  WebServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('products');
      return response.data;
    } catch (e) {
      print('Error when get data from API ${e.toString()}');
      return [];
    }
  }
}
