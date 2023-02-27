import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/module_product_info/response/product_info_response.dart';
import 'package:food_recipe_app/module_product_info/ui/screens/product_info_screen.dart';
import 'package:food_recipe_app/module_product_info/ui/widgets/nutrition_facts_widget.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import '../../../core/abstracts/states/state.dart';

class ProductInfoState extends States {
  final ProductInfoResponse response;
  final ProductInfoScreenState state;

  ProductInfoState(this.response, this.state);
  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Hero(
        tag: response.id,
        child: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
                child: CachedNetworkImage(
              imageUrl: response.image,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: 250,
            )),
            ResponsiveRowColumnItem(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                response.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
            ResponsiveRowColumnItem(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: NutritionFactsWidget(
                        percentageFat: response
                            .nutrition.caloricBreakdown.percentFat
                            .toString(),
                        fat: 'Fat',
                        amountFat: response.nutrition.fat,
                        percentageProteins: response
                            .nutrition.caloricBreakdown.percentProtein
                            .toString(),
                        amountProteins: response.nutrition.protein,
                        proteins: 'Protein',
                        percentageCarbs: response
                            .nutrition.caloricBreakdown.percentCarbs
                            .toString(),
                        amountCarbs: response.nutrition.carbs,
                        carbs: 'Carb'))),
            ResponsiveRowColumnItem(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: response.nutrition.nutrients.length,
                    itemBuilder: (context, index) {
                   return   ListTile(
                        leading: Text(response.nutrition.nutrients[index].name),
                        trailing: Text("${response.nutrition.nutrients[index].amount}g"),
                      );
                    })),
          ],
        ),
      ),
    ));
  }
}
