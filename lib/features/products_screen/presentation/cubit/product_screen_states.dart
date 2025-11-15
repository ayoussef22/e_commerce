import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/AddToWishlistEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';

abstract class ProductScreenStates {}

class ProductInitialState extends ProductScreenStates {}

class ProductLoadingState extends ProductScreenStates {}

class ProductErrorState extends ProductScreenStates {
  Failures failures;

  ProductErrorState({required this.failures});
}

class ProductSuccessState extends ProductScreenStates {
  ProductResponseEntity responseEntity;

  ProductSuccessState({required this.responseEntity});
}
class AddToCartLoadingState extends ProductScreenStates {}

class AddToCartErrorState extends ProductScreenStates {
  Failures failures;

  AddToCartErrorState({required this.failures});
}

class AddToCartSuccessState extends ProductScreenStates {
  AddToCartResponseEntity responseEntity;

  AddToCartSuccessState({required this.responseEntity});
}

class AddToWishlistLoadingState extends ProductScreenStates {}

class AddToWishlistErrorState extends ProductScreenStates {
  Failures failures;

  AddToWishlistErrorState({required this.failures});
}

class AddToWishlistSuccessState extends ProductScreenStates {
  AddToWishlistEntity responseEntity;

  AddToWishlistSuccessState({required this.responseEntity});
}
