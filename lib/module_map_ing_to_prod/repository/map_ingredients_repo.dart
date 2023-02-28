import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../request/map_ing_request.dart';

@injectable
class MapIngredientsRepo {

    Future<Response?> mapIngredients(MapIngredientsRequest request) async {
    Dio dio = Dio();
    Response? response = await dio.post(
      'https://api.spoonacular.com/food/ingredients/map',
    data: request.toJson(),
    queryParameters: {
      'apiKey': '8632d9a2b9b24b1a9946d878484ba7e5'
    }
    );
    if (response == null) return null;

    return response;
  }
  
}