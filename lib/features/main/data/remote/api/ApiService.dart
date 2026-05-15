import 'package:dio/dio.dart';

class ApiService {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<Response> getAreas() async {
    // Relative path: a leading "/" would replace the whole path and hit a 404 HTML page.
    return dio.get('list.php?a=list');
  }

  Future<Response> getCategories() async {
    return dio.get('categories.php');
  }

  Future<Response> getIngredients() async {
    return dio.get('list.php?i=list');
  }

  Future<Response> getRecipeByFirstLetter(String letter) {
    return dio.get('search.php?f=$letter');
  }
}