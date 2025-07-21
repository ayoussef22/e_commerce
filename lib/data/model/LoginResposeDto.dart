import 'package:flutter_e_commerce_c11_online/domain/entities/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
      super.message,
      super.user,
      super.token,});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? LoginUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

}

class LoginUserDto extends LoginUserEntity {
  LoginUserDto({
      super.name,
      super.email,
      this.role,});

  LoginUserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;


}