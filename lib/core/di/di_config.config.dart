// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:food_recipe_app/core/api_client/api_client.dart' as _i10;
import 'package:food_recipe_app/core/utils/global/global_state_manager.dart'
    as _i3;
import 'package:food_recipe_app/core/utils/logger/logger.dart' as _i4;
import 'package:food_recipe_app/main.dart' as _i6;
import 'package:food_recipe_app/module_map_ing_to_prod/repository/map_ingredients_repo.dart'
    as _i5;
import 'package:food_recipe_app/module_map_ing_to_prod/state_manager/map_ingredients_state_manager.dart'
    as _i11;
import 'package:food_recipe_app/module_map_ing_to_prod/ui/screens/map_ingredients_screen.dart'
    as _i12;
import 'package:food_recipe_app/module_product_info/repository/product_info_repo.dart'
    as _i7;
import 'package:food_recipe_app/module_product_info/state_manager/product_info_state_manager.dart'
    as _i8;
import 'package:food_recipe_app/module_product_info/ui/screens/product_info_screen.dart'
    as _i13;
import 'package:food_recipe_app/module_products/repository/products_repo.dart'
    as _i9;
import 'package:food_recipe_app/module_products/state_manager/products_state_manager.dart'
    as _i14;
import 'package:food_recipe_app/module_products/ui/screen/products_screen.dart'
    as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.GlobalStateManager>(_i3.GlobalStateManager());
  gh.factory<_i4.Logger>(() => _i4.Logger());
  gh.factory<_i5.MapIngredientsRepo>(() => _i5.MapIngredientsRepo());
  gh.factory<_i6.MyApp>(() => _i6.MyApp());
  gh.factory<_i7.ProductInfoRepo>(() => _i7.ProductInfoRepo());
  gh.factory<_i8.ProductsInfoCubit>(
      () => _i8.ProductsInfoCubit(gh<_i7.ProductInfoRepo>()));
  gh.factory<_i9.ProductsRepo>(() => _i9.ProductsRepo());
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(gh<_i4.Logger>()));
  gh.factory<_i11.MapIngredientsCubit>(
      () => _i11.MapIngredientsCubit(gh<_i5.MapIngredientsRepo>()));
  gh.factory<_i12.MapIngredientsScreen>(
      () => _i12.MapIngredientsScreen(gh<_i11.MapIngredientsCubit>()));
  gh.factory<_i13.ProductInfoScreen>(
      () => _i13.ProductInfoScreen(gh<_i8.ProductsInfoCubit>()));
  gh.factory<_i14.ProductsCubit>(
      () => _i14.ProductsCubit(gh<_i9.ProductsRepo>()));
  gh.factory<_i15.ProductsScreen>(
      () => _i15.ProductsScreen(gh<_i14.ProductsCubit>()));
  return getIt;
}
