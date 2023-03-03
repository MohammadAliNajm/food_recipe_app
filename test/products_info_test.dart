import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/module_product_info/repository/product_info_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_info_test.mocks.dart';


@GenerateMocks([Dio])
void main() {
  late ProductInfoRepo productInfoRepo;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    productInfoRepo = ProductInfoRepo();
  });

 test('getProducts returns response if successful', () async {
  final response = Response(requestOptions: RequestOptions(path: 'https://api.spoonacular.com/food/products/22347'),);

  // Mock the Dio client's response
  when(mockDio.get(
    'https://api.spoonacular.com/food/products/22347',
    
  )).thenAnswer((_) async => response);

  // Call the method under test
  final result = await productInfoRepo.getProductInfo(22347);

  // Verify the result
  expect(result, isNotNull);
 // expect(result, equals(response));
});
}
