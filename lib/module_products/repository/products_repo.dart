import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsRepo {
  Future<Response?> getProducts(String q ) async {
    Dio dio = Dio();
    Response? response = await dio.get(
      'https://api.spoonacular.com/food/products/search',
      queryParameters: {
        'query' : q,
        'apiKey': '8632d9a2b9b24b1a9946d878484ba7e5'
      }
    );
    if (response == null) return null;

    return response;
  }
}
