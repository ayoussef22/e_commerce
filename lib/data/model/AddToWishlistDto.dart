import 'package:flutter_e_commerce_c11_online/domain/entities/AddToWishlistEntity.dart';

class AddToWishlistDto extends AddToWishlistEntity {
  AddToWishlistDto({
      super.status,
      super.message,
      super.data,
  this.statusMsg});

  AddToWishlistDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? statusMsg;

}