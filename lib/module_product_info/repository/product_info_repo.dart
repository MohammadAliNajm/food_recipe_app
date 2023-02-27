import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductInfoRepo {
  Future<Response?> getProductInfo(int id) async {
    Dio dio = Dio();
    Response? response = await dio.get(
        'https://api.spoonacular.com/food/products/${id}',
        queryParameters: {'apiKey': '8632d9a2b9b24b1a9946d878484ba7e5'});
    if (response == null) return null;

    return response;
  }
}
