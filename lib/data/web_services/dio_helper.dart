import 'package:dio/dio.dart';

class DioHelper{
   static  Dio dio= Dio(
       BaseOptions(
         baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
         receiveDataWhenStatusError: true,
         headers: {
           'Content-Type':'application/json',
           'Accept':'application/json',

         },
       )
   );
   static Future<Response> getData({
     required String url,
      Map<String, dynamic>? query,
     var token ,
   }) async{
     dio.options.headers={'Authorization':'Bearer $token'};
     return await dio.get(url, queryParameters: query);
   }

   static Future<Response> postData({
     required String url,
     Map<String, dynamic>? query,
     required Map<String, dynamic>? data
   })async {
     return dio.post(url, queryParameters: query, data: data);
   }

}

