import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
      json.decode(str).map((x) => ProductsModel.fromJson(x)),
    );

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  int id;
  String name;
  int ratings;
  List<String> image;
  List<Variant> variants;

  ProductsModel({
    required this.id,
    required this.name,
    required this.ratings,
    required this.image,
    required this.variants,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    name: json["name"],
    ratings: json["ratings"],
    image: List<String>.from(json["image"]),
    variants: List<Variant>.from(
      json["variants"].map((x) => Variant.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ratings": ratings,
    "image": List<dynamic>.from(image.map((x) => x)),
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
  };
}

class Variant {
  String name;
  int price;
  int mrp;
  int? quantity;

  Variant({
    required this.name,
    required this.price,
    required this.mrp,
    this.quantity,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    name: json["name"],
    price: json["price"],
    mrp: json["mrp"],
    quantity: json['quantity'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "mrp": mrp,
    if (quantity != null) 'quantity': quantity,
  };
}
