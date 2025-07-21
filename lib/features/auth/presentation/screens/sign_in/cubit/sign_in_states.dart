import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/LoginResponseEntity.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  LoginResponseEntity responseEntity;
  LoginSuccessState({required this.responseEntity});
}
class LoginErrorState extends LoginStates{
  Failures failures;
  LoginErrorState({required this.failures});
}