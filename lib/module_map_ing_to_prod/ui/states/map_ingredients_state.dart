import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/response/map_ingredients_response.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/screens/map_ingredients_screen.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/widgets/products_list.dart';
import 'package:food_recipe_app/module_products/ui/widgets/product_card.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../core/abstracts/states/state.dart';

class MapIngredientsState extends States {
  final MapIngredientsScreenState state;
  final List<MapIngredientsResponse> response;

  MapIngredientsState(this.state, this.response);
  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: response.isNotEmpty
          ? GroupedListView<dynamic, String>(
            shrinkWrap: true,
              elements: response,
              groupBy: (element) => element.originalName,
              groupSeparatorBuilder: (val) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${val} products:',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: greenColor),
                ),
              ),
              itemBuilder: (context, element) {
                return ProductsList(products: element.products);
              },
            )
          //  ListView.separated(
          //     physics: NeverScrollableScrollPhysics(),
          //     separatorBuilder: (context, index) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //         child: Text(
          //           response[index].originalName,
          //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //         ),
          //       );
          //     },
          //     shrinkWrap: true,
          //     itemCount: response.length,
          //     itemBuilder: (context, index) {
          //       return ProductsList(products: response[index].products);
          //     })

          : SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: Text('No products found!'))],
              ),
            ),
    );
  }
}
