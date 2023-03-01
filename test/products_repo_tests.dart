import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/module_products/repository/products_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_repo_tests.mocks.dart';




@GenerateMocks([Dio])
void main() {
  late ProductsRepo productsRepo;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    productsRepo = ProductsRepo();
  });

 test('getProducts returns response if successful', () async {
  final response = Response(requestOptions: RequestOptions(path: 'https://api.spoonacular.com/food/products/search'),);

  // Mock the Dio client's response
  when(mockDio.get(
    any,
    queryParameters: anyNamed('queryParameters')
  )).thenAnswer((_) async => response);

  // Call the method under test
  final result = await productsRepo.getProducts('greek');

  // Verify the result
  expect(result, isNotNull);
 // expect(result, equals(response));
});

}