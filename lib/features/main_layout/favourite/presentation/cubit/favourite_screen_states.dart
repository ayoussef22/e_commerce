import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/AddToWishlistEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/GetWishlistResponseEntity.dart';

abstract class FavouriteStates {}

class GetFavouriteInitialState extends FavouriteStates {}

class GetFavouriteLoadingState extends FavouriteStates {}

class GetFavouriteSuccessState extends FavouriteStates {
  GetWishlistResponseEntity responseEntity;

  GetFavouriteSuccessState({required this.responseEntity});
}

class GetFavouriteErrorState extends FavouriteStates {
  Failures failures;

  GetFavouriteErrorState({required this.failures});
}

class DeleteItemInWishlistLoadingState extends FavouriteStates {}

class DeleteItemInWishlistSuccessState extends FavouriteStates {
  AddToWishlistEntity responseEntity;

  DeleteItemInWishlistSuccessState({required this.responseEntity});
}

class DeleteItemInWishlistErrorState extends FavouriteStates {
  Failures failures;

  DeleteItemInWishlistErrorState({required this.failures});
}
