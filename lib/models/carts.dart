import 'dart:convert';

List<Carts> cartsFromJson(String str) => List<Carts>.from(json.decode(str).map((x) => Carts.fromJson(x)));


class Carts {
  int id;
  int userId;
  DateTime date;
  List<Product> products;
  int v;

  Carts({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory Carts.fromJson(Map<String, dynamic> json) => Carts(
    id: json["id"],
    userId: json["userId"],
    date: DateTime.parse(json["date"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    v: json["__v"],
  );

}

class Product {
  int productId;
  int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    quantity: json["quantity"],
  );

}
