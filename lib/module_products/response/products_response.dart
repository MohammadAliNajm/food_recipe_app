// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
    ProductResponse({
        required this.products,
        required this.totalProducts,
        required this.type,
        required this.offset,
        required this.number,
    });

    List<Product> products;
    int totalProducts;
    String type;
    int offset;
    int number;

    factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        totalProducts: json["totalProducts"],
        type: json["type"],
        offset: json["offset"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "totalProducts": totalProducts,
        "type": type,
        "offset": offset,
        "number": number,
    };
}

class Product {
    Product({
        required this.id,
        required this.title,
        required this.imageType,
    });

    int id;
    String title;
    String imageType;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        imageType: json["imageType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imageType": imageType,
    };
}
