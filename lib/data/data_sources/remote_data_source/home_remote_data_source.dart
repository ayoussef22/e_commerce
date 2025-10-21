import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';

abstract class HomeRemoteDataSource{
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
  Future<Either<Failures,AddToCartResponseEntity>> addToCart(String productId);

}