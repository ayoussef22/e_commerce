import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/core/api/api_manager.dart';
import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/data/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:flutter_e_commerce_c11_online/data/model/GetCartResponseDto.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/end_points.dart';
import '../../../core/widget/shared_preference_utils.dart';


@Injectable(as:CartRemoteDataSource  )
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        //internet
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager
            .getData(EndPoints.addToCart, headers: {'token': token.toString()});

        var getCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //success
          return Right(getCartResponse);
        } else {
          //failed
          return Left(ServerError(errorMessage: getCartResponse.message));
        }
      } else {
        //no internet
        return Left(NetworkError(
            errorMessage: "Please Check Your Internet Connection"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: "Exception: $e"));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(String productId) async{
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        //internet
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager
            .deleteData('${EndPoints.addToCart}/$productId', headers: {'token': token.toString()});

        var deleteItemInCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //success
          return Right(deleteItemInCartResponse);
        } else {
          //failed
          return Left(ServerError(errorMessage: deleteItemInCartResponse.message));
        }
      } else {
        //no internet
        return Left(NetworkError(
            errorMessage: "Please Check Your Internet Connection"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: "Exception: $e"));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(String productId, int count) async{
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        //internet
        var token = SharedPreferenceUtils.getData(key: 'token');

        var response = await apiManager
            .updateData('${EndPoints.addToCart}/$productId', headers: {'token': token.toString()},
        body: {'count' : '$count'});

        var updateCountInCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //success
          return Right(updateCountInCartResponse);
        } else {
          //failed
          return Left(ServerError(errorMessage: updateCountInCartResponse.message));
        }
      } else {
        //no internet
        return Left(NetworkError(
            errorMessage: "Please Check Your Internet Connection"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: "Exception: $e"));
    }
  }
}
