import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/core/api/api_manager.dart';
import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/core/widget/shared_preference_utils.dart';
import 'package:flutter_e_commerce_c11_online/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:flutter_e_commerce_c11_online/data/model/AddToCartResponseDto.dart';
import 'package:flutter_e_commerce_c11_online/data/model/CategoryOrBrandResponseDto.dart';
import 'package:flutter_e_commerce_c11_online/data/model/ProductResponseDto.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/end_points.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        //internet
        var response = await apiManager.getData(EndPoints.getAllCategories);

        var getAllCategoriesResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //success
          return Right(getAllCategoriesResponse);
        } else {
          //failed
          return Left(
              ServerError(errorMessage: getAllCategoriesResponse.message));
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
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        //internet
        var response = await apiManager.getData(EndPoints.getAllBrands);

        var getAllBrandsResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //success
          return Right(getAllBrandsResponse);
        } else {
          //failed
          return Left(ServerError(errorMessage: getAllBrandsResponse.message));
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
  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        //internet
        var response = await apiManager.getData(EndPoints.getAllProducts);

        var getAllProductsResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //success
          return Right(getAllProductsResponse);
        } else {
          //failed
          return Left(
              ServerError(errorMessage: getAllProductsResponse.message));
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
  Future<Either<Failures, AddToCartResponseDto>> addToCart(
      String productId) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        //internet

        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.postData(EndPoints.addToCart,
            body: {'productId': productId}, headers: {'token': token.toString()});

        var addToCartResponse = AddToCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //success
          return Right(addToCartResponse);
        } else {
          //failed
          return Left(ServerError(errorMessage: addToCartResponse.message));
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
