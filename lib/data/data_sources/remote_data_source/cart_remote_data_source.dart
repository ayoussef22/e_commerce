import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/GetCartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures,GetCartResponseEntity>>getCart();
  Future<Either<Failures,GetCartResponseEntity>>deleteItemInCart(String productId);
  Future<Either<Failures,GetCartResponseEntity>>updateCountInCart(String productId,int count);

}