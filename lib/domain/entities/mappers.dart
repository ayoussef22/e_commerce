import 'package:flutter_e_commerce_c11_online/domain/entities/GetWishlistResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';

extension WishlistMapper on GetWishlistDataEntity {
  ProductEntity toProductEntity() {
    const baseUrl = 'https://ecommerce.routemisr.com/Route-Academy-products/';
    return ProductEntity(
        id: id ?? '',
        title: title ?? '',
        description: description ?? '',
        imageCover: imageCover ?? '',
        price: price ?? 0,
        ratingsAverage: ratingsAverage ?? 0,
        sold: sold ?? 0,
      images: images?.isNotEmpty == true
          ? images!.map((img) {
        if (img.startsWith('http')) {
          return img;
        } else {
          return '$baseUrl$img';
        }
      }).toList()
          : [imageCover ?? ''],
    );
  }
}
