class Product {
  late int id;
  late String title;
  late dynamic price;
  late String description;
  late String category;
  late String image;
  late Map<String, dynamic> rating;
  late dynamic quantity;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'];
  }
}
