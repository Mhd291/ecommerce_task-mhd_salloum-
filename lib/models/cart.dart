import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

class Cart {
  int id;
  int userId;
  DateTime date;
  List<Product> products;
  int v;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
