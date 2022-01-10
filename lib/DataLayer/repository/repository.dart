import '../model/product.dart';
import '../web_services/web_services.dart';

class Repository {
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    WebServices webServices = WebServices();
    await webServices.getAllProducts().then((value) {
      products =
          value.map((itemProducts) => Product.fromJson(itemProducts)).toList();
      print('Data is assign in model');
    });

    return products;
  }
}
