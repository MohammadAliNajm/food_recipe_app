import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/repository/map_ingredients_repo.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/request/map_ing_request.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_repo_tests.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MapIngredientsRepo ingredientsRepo;
  late MockDio mockdio;

  setUp(() {
    ingredientsRepo = MapIngredientsRepo();
    mockdio = MockDio();
  });

  test('The method should return a response if request is valid', () async {
     final response = Response(
      
            statusCode: 200,
            requestOptions: RequestOptions(
                path: 'https://api.spoonacular.com/food/ingredients/map'));
    when(mockdio.post(any,
            data: {
              'ingredients': ['eggs'],
              'servings': 1
            },
            queryParameters: anyNamed('queryParameters')))
        .thenAnswer((realInvocation) => Future.value(Response(
            statusCode: 200,
            requestOptions: RequestOptions(
                path: 'https://api.spoonacular.com/food/ingredients/map'))));

    final result = await ingredientsRepo.mapIngredients(
        MapIngredientsRequest(servings: 3, ingredients: ['eggs','milk']));

    expect(result?.statusCode, equals(response.statusCode));
  });
}
