import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/request/map_ing_request.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/state_manager/map_ingredients_state_manager.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/states/map_ingredients_state.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/states/map_ingredients_state_init.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/abstracts/states/state.dart';
import '../../../core/constants/Colors.dart';
import '../../../core/utils/custom_loading_button.dart';
import '../widgets/ingredients_widget.dart';

@injectable
class MapIngredientsScreen extends StatefulWidget {
  const MapIngredientsScreen(this.cubit);

  final MapIngredientsCubit cubit;

  @override
  MapIngredientsScreenState createState() => MapIngredientsScreenState();
}

class MapIngredientsScreenState extends State<MapIngredientsScreen> {
  List<String> ingredients = ['eggs', 'meat', 'olive oil', 'rice'];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  mapIngredients(MapIngredientsRequest req) {
    widget.cubit.mapIngredients(this, req);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                  child: Text('Map Ingredients to Products!')),
              ResponsiveRowColumnItem(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              IngredientsWidget(ingredient: ingredients[index]),
                        );
                      })),
              
                
             
              ResponsiveRowColumnItem(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomLoadingButton(
                  bgColor: greenColor,
                  text: 'Map ingredients to products',
                  buttonTab: () {
                    print(ingredientsToSend);
                    mapIngredients(MapIngredientsRequest(
                        servings: ingredientsToSend.length,
                        ingredients: ingredientsToSend));
                  },
                  textColor: Colors.white,
                  loading: false,
                ),
              )),
              ResponsiveRowColumnItem(
                  child: BlocBuilder<MapIngredientsCubit, States>(
                      bloc: widget.cubit,
                      builder: (context, state) {
                        return state.getUI(context);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
