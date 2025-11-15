import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/LoginResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/RegisterResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await authRemoteDataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
