import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/core/abstracts/states/error_state.dart';
import 'package:food_recipe_app/core/abstracts/states/loading_state.dart';
import 'package:food_recipe_app/module_products/repository/products_repo.dart';
import 'package:food_recipe_app/module_products/response/products_response.dart';
import 'package:food_recipe_app/module_products/ui/screen/products_screen.dart';
import 'package:food_recipe_app/module_products/ui/states/products_state.dart';
import 'package:injectable/injectable.dart';

import '../../core/abstracts/states/state.dart';

@injectable
class ProductsCubit extends Cubit<States> {
  ProductsCubit(this.productsRepo, ) : super(LoadingState());
  final ProductsRepo productsRepo;
 

  getProducts(ProductsScreenState state, String q) {
    emit(LoadingState());
    productsRepo.getProducts(q).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection Error',
            retry: () {
              getProducts(state, q);
            }));
      } else if (value.statusCode == 200) {
        Map<String, dynamic> data = value.data;

        ProductResponse resp = ProductResponse.fromJson(data);
        emit(ProductState(resp, state));
      }
    });
  }
}
