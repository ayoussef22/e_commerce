import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/LoginResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/RegisterResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures,LoginResponseEntity>>login(String email, String password);
}
