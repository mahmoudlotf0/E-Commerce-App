import '../model/product.dart';
import '../web_services/web_services.dart';

class Repository {
  Future<List<Product>> getAllProducts() async {
    List<Product> allProducts = [];
    WebServices webServices = WebServices();
    await webServices.getAllProducts('products').then((value) {
      allProducts =
          value.map((itemProducts) => Product.fromJson(itemProducts)).toList();
    });

    return allProducts;
  }
}
