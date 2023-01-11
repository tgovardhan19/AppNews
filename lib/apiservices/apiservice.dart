import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/model.dart';

class NewsApiServices {
 static String _apikey = "a83521b024bc4481848877608c8fc6ee";
  String _url = 
  "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a83521b024bc4481848877608c8fc6ee";

late Dio _dio;

NewsApiServices() {
  _dio = Dio();
}

Future<List<Article?>?> fetchNewsArticle() async {
  try {
    Response response = await _dio.get(_url);
   print(response);
    Welcome welcome = Welcome.fromJson(response.data);
    return welcome.articles;
  } on DioError catch (e) {
    print(e);
   return null!;
   
} 
}
}