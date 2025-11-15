import 'package:flutter_e_commerce_c11_online/domain/entities/GetCartResponseEntity.dart';

import '../../../core/errors/Failures.dart';

abstract class GetCartStates {}

class GetCartInitialState extends GetCartStates {}

class GetCartLoadingState extends GetCartStates {}

class GetCartSuccessState extends GetCartStates {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}

class GetCartErrorState extends GetCartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

class DeleteItemInCartLoadingState extends GetCartStates {}

class DeleteItemInCartSuccessState extends GetCartStates {
  GetCartResponseEntity responseEntity;

  DeleteItemInCartSuccessState({required this.responseEntity});
}

class  DeleteItemInCartErrorState extends GetCartStates {
  Failures failures;

  DeleteItemInCartErrorState({required this.failures});
}

class UpdateCountInCartLoadingState extends GetCartStates {}

class UpdateCountInCartSuccessState extends GetCartStates {
  GetCartResponseEntity responseEntity;

  UpdateCountInCartSuccessState({required this.responseEntity});
}

class UpdateCountInCartErrorState extends GetCartStates {
  Failures failures;

  UpdateCountInCartErrorState({required this.failures});
}
