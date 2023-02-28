// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_recipe_app/module_product_info/response/product_info_response.dart';

class MapIngredientsRequest {
  int servings;
  List<String> ingredients;
  MapIngredientsRequest({
    required this.servings,
    required this.ingredients,
  });

  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ingredients'] = ingredients;
    data['servings'] = servings;
   
    return data;
  }
}
