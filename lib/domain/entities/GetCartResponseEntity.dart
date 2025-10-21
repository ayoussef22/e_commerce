import 'package:flutter_e_commerce_c11_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataEntity? data;


}

class GetDataEntity {
  GetDataEntity({
      this.id, 
      this.cartOwner, 
      this.products,
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<GetProductCartEntity>? products;
  num? v;
  num? totalCartPrice;


}

class GetProductCartEntity {
  GetProductCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  GetProductEntity? product;
  num? price;


}

class GetProductEntity {
  GetProductEntity({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      });

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;

}