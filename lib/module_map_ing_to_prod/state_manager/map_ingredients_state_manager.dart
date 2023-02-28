import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/core/abstracts/states/error_state.dart';
import 'package:food_recipe_app/core/abstracts/states/loading_state.dart';
import 'package:food_recipe_app/core/abstracts/states/no_products_states.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/request/map_ing_request.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/response/map_ingredients_response.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/screens/map_ingredients_screen.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/states/map_ingredients_state.dart';
import 'package:food_recipe_app/module_products/response/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/abstracts/states/state.dart';
import '../repository/map_ingredients_repo.dart';

@injectable
class MapIngredientsCubit extends Cubit<States> {
  MapIngredientsCubit(this.mapIngredientsRepo) : super(NoProductsState());
  final MapIngredientsRepo mapIngredientsRepo;
  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  mapIngredients(
      MapIngredientsScreenState state, MapIngredientsRequest request) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());

    mapIngredientsRepo.mapIngredients(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection Error',
            retry: () {
              mapIngredients(state, request);
            }));
      } else if (value.statusCode == 200) {
        List<MapIngredientsResponse> prods = [];

        for (var item in value.data) {
          prods.add(MapIngredientsResponse.fromJson(item));
        }
        print(prods);
        emit(MapIngredientsState(state, prods));
      }
    });
  }
}
