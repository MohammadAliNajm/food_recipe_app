// To parse this JSON data, do
//
//     final mapIngredientsResponse = mapIngredientsResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<MapIngredientsResponse> mapIngredientsResponseFromJson(String str) => List<MapIngredientsResponse>.from(json.decode(str).map((x) => MapIngredientsResponse.fromJson(x)));

String mapIngredientsResponseToJson(List<MapIngredientsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MapIngredientsResponse {
    MapIngredientsResponse({
        required this.original,
        required this.originalName,
        required this.ingredientImage,
        required this.meta,
        required this.products,
    });

    String original;
    String originalName;
    String ingredientImage;
    List<String> meta;
    List<Product> products;

    factory MapIngredientsResponse.fromJson(Map<String, dynamic> json) => MapIngredientsResponse(
        original: json["original"],
        originalName: json["originalName"],
        ingredientImage: json["ingredientImage"],
        meta: List<String>.from(json["meta"].map((x) => x)),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "original": original,
        "originalName": originalName,
        "ingredientImage": ingredientImage,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        required this.id,
        required this.upc,
        required this.title,
    });

    int id;
    String upc;
    String title;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        upc: json["upc"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "upc": upc,
        "title": title,
    };
}
