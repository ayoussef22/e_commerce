import 'package:dio/dio.dart';
import 'package:flutter_e_commerce_c11_online/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{
   late Dio dio;

  ApiManager(){
    dio=Dio();
  }

  Future<Response> getData(String endPoint,{Map<String, dynamic>? queryParameters}){
   return dio.get(AppConstants.baseUrl+endPoint,queryParameters: queryParameters,
   options: Options(validateStatus: (status) => true));
  }

   Future<Response> postData(String endPoint,{Map<String, dynamic>? body , Map<String, dynamic>? headers}){
     return dio.post(AppConstants.baseUrl+endPoint,data: body,
         options: Options(headers: headers, validateStatus: (status) => true ) );
   }
}