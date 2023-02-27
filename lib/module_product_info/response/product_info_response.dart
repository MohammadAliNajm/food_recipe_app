// To parse this JSON data, do
//
//     final productInfoResponse = productInfoResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductInfoResponse productInfoResponseFromJson(String str) => ProductInfoResponse.fromJson(json.decode(str));

String productInfoResponseToJson(ProductInfoResponse data) => json.encode(data.toJson());

class ProductInfoResponse {
    ProductInfoResponse({
        required this.id,
        required this.title,
        required this.price,
        required this.likes,
        required this.badges,
        required this.importantBadges,
        required this.nutrition,
        required this.servings,
        required this.spoonacularScore,
        required this.breadcrumbs,
        required this.aisle,
        required this.description,
        required this.image,
        required this.imageType,
        required this.images,
        required this.generatedText,
        required this.upc,
        required this.brand,
        required this.ingredients,
        required this.ingredientCount,
        required this.ingredientList,
    });

    int id;
    String title;
    double price;
    num likes;
    List<String> badges;
    List<String> importantBadges;
    Nutrition nutrition;
    Servings servings;
    num spoonacularScore;
    List<String> breadcrumbs;
    dynamic aisle;
    String description;
    String image;
    String imageType;
    List<String> images;
    dynamic generatedText;
    String upc;
    String brand;
    List<Ingredient> ingredients;
    int ingredientCount;
    String ingredientList;

    factory ProductInfoResponse.fromJson(Map<String, dynamic> json) => ProductInfoResponse(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        likes: json["likes"],
        badges: List<String>.from(json["badges"].map((x) => x)),
        importantBadges: List<String>.from(json["importantBadges"].map((x) => x)),
        nutrition: Nutrition.fromJson(json["nutrition"]),
        servings: Servings.fromJson(json["servings"]),
        spoonacularScore: json["spoonacularScore"],
        breadcrumbs: List<String>.from(json["breadcrumbs"].map((x) => x)),
        aisle: json["aisle"]?? '',
        description: json["description"],
        image: json["image"],
        imageType: json["imageType"],
        images: List<String>.from(json["images"].map((x) => x)),
        generatedText: json["generatedText"],
        upc: json["upc"],
        brand: json["brand"],
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        ingredientCount: json["ingredientCount"],
        ingredientList: json["ingredientList"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "likes": likes,
        "badges": List<dynamic>.from(badges.map((x) => x)),
        "importantBadges": List<dynamic>.from(importantBadges.map((x) => x)),
        "nutrition": nutrition.toJson(),
        "servings": servings.toJson(),
        "spoonacularScore": spoonacularScore,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
        "aisle": aisle,
        "description": description,
        "image": image,
        "imageType": imageType,
        "images": List<dynamic>.from(images.map((x) => x)),
        "generatedText": generatedText,
        "upc": upc,
        "brand": brand,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "ingredientCount": ingredientCount,
        "ingredientList": ingredientList,
    };
}

class Ingredient {
    Ingredient({
        required this.name,
        required this.safetyLevel,
        required this.description,
    });

    String name;
    String safetyLevel;
    String description;

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        safetyLevel: json["safety_level"] ?? '',
        description: json["description"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "safety_level": safetyLevel,
        "description": description,
    };
}

class Nutrition {
    Nutrition({
        required this.nutrients,
        required this.caloricBreakdown,
        required this.calories,
        required this.fat,
        required this.protein,
        required this.carbs,
    });

    List<Nutrient> nutrients;
    CaloricBreakdown caloricBreakdown;
    num calories;
    String fat;
    String protein;
    String carbs;

    factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        nutrients: List<Nutrient>.from(json["nutrients"].map((x) => Nutrient.fromJson(x))),
        caloricBreakdown: CaloricBreakdown.fromJson(json["caloricBreakdown"]),
        calories: json["calories"],
        fat: json["fat"],
        protein: json["protein"],
        carbs: json["carbs"],
    );

    Map<String, dynamic> toJson() => {
        "nutrients": List<dynamic>.from(nutrients.map((x) => x.toJson())),
        "caloricBreakdown": caloricBreakdown.toJson(),
        "calories": calories,
        "fat": fat,
        "protein": protein,
        "carbs": carbs,
    };
}

class CaloricBreakdown {
    CaloricBreakdown({
        required this.percentProtein,
        required this.percentFat,
        required this.percentCarbs,
    });

    double percentProtein;
    double percentFat;
    double percentCarbs;

    factory CaloricBreakdown.fromJson(Map<String, dynamic> json) => CaloricBreakdown(
        percentProtein: json["percentProtein"]?.toDouble(),
        percentFat: json["percentFat"],
        percentCarbs: json["percentCarbs"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "percentProtein": percentProtein,
        "percentFat": percentFat,
        "percentCarbs": percentCarbs,
    };
}

class Nutrient {
    Nutrient({
        required this.name,
        required this.amount,
        required this.unit,
        required this.percentOfDailyNeeds,
    });

    String name;
    double amount;
    String unit;
    double percentOfDailyNeeds;

    factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        percentOfDailyNeeds: json["percentOfDailyNeeds"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "unit": unit,
        "percentOfDailyNeeds": percentOfDailyNeeds,
    };
}

class Servings {
    Servings({
        required this.number,
        required this.size,
        required this.unit,
    });

    num number;
    num size;
    String unit;

    factory Servings.fromJson(Map<String, dynamic> json) => Servings(
        number: json["number"],
        size: json["size"],
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "size": size,
        "unit": unit,
    };
}
