import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/core/api/api_manager.dart';
import 'package:flutter_e_commerce_c11_online/core/api/end_points.dart';
import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:flutter_e_commerce_c11_online/data/model/LoginResposeDto.dart';
import 'package:flutter_e_commerce_c11_online/data/model/RegisterResponseDto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {



    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          EndPoints.register,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": rePassword,
            "phone": phone
          },
        );

        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message));
        }
      } else {
        return Left(NetworkError(errorMessage: "Please Check Your Internet Connection"));
      }
    } catch (e, s) {
      print("❌ Exception occurred: $e");
      print("📍 StackTrace: $s");
      return Left(ServerError(errorMessage: "Exception: $e"));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDto>> login(String email,String password) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(EndPoints.signIn, body: {
          "email": email,
          "password": password
        });
        var loginResponse = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message));
        }
      } else {
        return Left(NetworkError(
            errorMessage: "Please Check Your Internet Connection"));
      }
    } catch (e, s) {
      print("❌ Exception occurred: $e");
      print("📍 StackTrace: $s");
      return Left(ServerError(errorMessage: "Exception: $e"));
    }
  }



}