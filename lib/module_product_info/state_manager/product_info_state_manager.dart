import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/core/abstracts/states/error_state.dart';
import 'package:food_recipe_app/core/abstracts/states/loading_state.dart';
import 'package:food_recipe_app/core/abstracts/states/no_data_available.dart';
import 'package:injectable/injectable.dart';
import '../../core/abstracts/states/state.dart';
import '../repository/product_info_repo.dart';
import '../response/product_info_response.dart';
import '../ui/screens/product_info_screen.dart';
import '../ui/states/product_info_state.dart';

@injectable
class ProductsInfoCubit extends Cubit<States> {
  ProductsInfoCubit(
    this.productsRepo,
  ) : super(LoadingState());
  final ProductInfoRepo productsRepo;

  getProductInfo(ProductInfoScreenState state, int q) {
    emit(LoadingState());
    productsRepo.getProductInfo(q).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection Error',
            retry: () {
              getProductInfo(state, q);
            }));
      } else if (value.statusCode == 200) {
        Map<String, dynamic> data = value.data;

        ProductInfoResponse resp = ProductInfoResponse.fromJson(data);
        print(data);
        if (resp.nutrition.calories == null) {
          emit(NoDataState());
        }else {
           emit(ProductInfoState(resp, state));
        }
       
      }
    });
  }
}
