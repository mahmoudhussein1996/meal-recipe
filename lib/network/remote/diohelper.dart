import 'package:dio/dio.dart';


class DioHelper
{

  static late Dio dio;
 static init()
 {
     dio = Dio(
     BaseOptions(
       baseUrl: 'http://www.themealdb.com/api/json/v1/1/',
       receiveDataWhenStatusError: true
     )
   );
 }

 static Future<Response> getData({required String url, required Map<String,dynamic> query}) async
 {
   return await dio.get(url,queryParameters: query);
 }
}