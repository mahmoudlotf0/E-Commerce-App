import 'package:dio/dio.dart';

class WebServices {
  late Dio dio;
  WebServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('products');
      return response.data;
    } catch (e) {
      print('Error when get data: ${e.toString()}');
      return [];
    }
  }
}
