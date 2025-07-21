import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/RegisterResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

 Future<Either<Failures,RegisterResponseEntity>> invoke(String name,
      String email, String password, String rePassword, String phone){
    return authRepository.register(name, email, password, rePassword, phone);
  }
}