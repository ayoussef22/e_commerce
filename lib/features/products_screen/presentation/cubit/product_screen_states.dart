import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
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
