import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/response/map_ingredients_response.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/screens/map_ingredients_screen.dart';
import 'package:food_recipe_app/module_products/ui/widgets/product_card.dart';
import '../../../core/abstracts/states/state.dart';

class MapIngredientsState extends States {
  final MapIngredientsScreenState state;
  final List<MapIngredientsResponse> response;

  MapIngredientsState(this.state, this.response);
  @override
  Widget getUI(BuildContext context) {
   
    return SafeArea(
      child: response.isNotEmpty
          ? ListView.separated(
            
            physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text(response[index].originalName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                );
              },
              shrinkWrap: true,
              itemCount: response.length,
              itemBuilder: (context, index) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: response[0].products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        productTitle: response[0].products[index].title,
                        onTap: () {}
                        );
                  },
                );
              })
          : const Center(
              child: Text('No products found!'),
            ),
    );
  }
}
