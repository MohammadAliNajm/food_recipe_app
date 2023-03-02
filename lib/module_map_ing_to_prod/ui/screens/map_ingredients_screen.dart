import 'package:advanced_search/advanced_search.dart';
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
  late AsyncSnapshot loadingSnapshot;
  @override
  void initState() {
    loadingSnapshot = AsyncSnapshot.nothing();

    widget.cubit.loadingStream.listen((event) {
      setState(() {
        loadingSnapshot = event;
      });
    });

    super.initState();
  }

  mapIngredients(MapIngredientsRequest req) {
    widget.cubit.mapIngredients(this, req);
  }
  refresh() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Map Ingredients to Products!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                // ListView.builder(
                //     physics: const NeverScrollableScrollPhysics(),
                //     scrollDirection: Axis.vertical,
                //     shrinkWrap: true,
                //     itemCount: ingredients.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child:
                //             IngredientsWidget(ingredient: ingredients[index]),
                //       );
                //     }),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Padding(
                      padding: const EdgeInsets.only(left:16.0,top: 16),
                      child: AdvancedSearch(
                          hintText: "Enter an ingredient",
                          searchItems: ingredients,
                          onItemTap: (index, string) {
                            setState(() {
                              ingredientsToSend.add(string);
                            });
                            print(ingredientsToSend);
                          }),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: GridView.builder(
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.5,
      crossAxisCount: 2,
      ),
                      shrinkWrap: true,
                      itemCount: ingredientsToSend.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IngredientsWidget(
                              ingredient: ingredientsToSend[index], state: this,),
                        );
                      }),
                ),
                Padding(
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
                    loading: loadingSnapshot.connectionState ==
                        ConnectionState.waiting,
                  ),
                ),
                BlocBuilder<MapIngredientsCubit, States>(
                    bloc: widget.cubit,
                    builder: (context, state) {
                      return state.getUI(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
