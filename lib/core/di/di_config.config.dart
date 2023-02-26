// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:food_recipe_app/core/api_client/api_client.dart' as _i7;
import 'package:food_recipe_app/core/utils/global/global_state_manager.dart'
    as _i3;
import 'package:food_recipe_app/core/utils/logger/logger.dart' as _i4;
import 'package:food_recipe_app/main.dart' as _i5;
import 'package:food_recipe_app/module_products/repository/products_repo.dart'
    as _i6;
import 'package:food_recipe_app/module_products/state_manager/products_state_manager.dart'
    as _i8;
import 'package:food_recipe_app/module_products/ui/screen/products_screen.dart'
    as _i9;
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
  gh.factory<_i5.MyApp>(() => _i5.MyApp());
  gh.factory<_i6.ProductsRepo>(() => _i6.ProductsRepo());
  gh.factory<_i7.ApiClient>(() => _i7.ApiClient(gh<_i4.Logger>()));
  gh.factory<_i8.ProductsCubit>(
      () => _i8.ProductsCubit(gh<_i6.ProductsRepo>()));
  gh.factory<_i9.ProductsScreen>(
      () => _i9.ProductsScreen(gh<_i8.ProductsCubit>()));
  return getIt;
}
