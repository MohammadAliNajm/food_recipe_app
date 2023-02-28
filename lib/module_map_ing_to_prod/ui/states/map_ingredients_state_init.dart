import 'package:flutter/material.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/screens/map_ingredients_screen.dart';

abstract class MapIngredientsStateInit{
  final MapIngredientsScreenState state;

  MapIngredientsStateInit(this.state);
 
 
  Widget getUI(BuildContext context);
 
}
