import 'package:ecommerceapp/DataLayer/model/product.dart';
import 'package:ecommerceapp/DataLayer/web_services/web_services.dart';

class Repository {
  WebServices webServices;
  Repository(this.webServices);
  Future<List<Product>> getAllProducts() async {
    final List products = await webServices.getAllProducts();
    return products.map((e) => Product.fromJson(e)).toList();
  }
}
