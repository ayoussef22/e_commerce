import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/GetWishlistResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/delete_item_in_wishlist_use_case.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/get_wishlist_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/favourite/presentation/cubit/favourite_screen_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavouriteScreenViewModel extends Cubit<FavouriteStates> {
  GetWishlistUseCase wishlistUseCase;
  DeleteItemInWishlistUseCase deleteItemInWishlistUseCase;

  FavouriteScreenViewModel({required this.wishlistUseCase,required this.deleteItemInWishlistUseCase})
      : super(GetFavouriteInitialState());

//todo : hold data & handle logic
  List<GetWishlistDataEntity> wishlistItems = [];

  static FavouriteScreenViewModel of(BuildContext context) =>
      BlocProvider.of<FavouriteScreenViewModel>(context);

  getWishlist() async {
    emit(GetFavouriteLoadingState());
    var either = await wishlistUseCase.invoke();
    either.fold((error) {
      emit(GetFavouriteErrorState(failures: error));
    }, (response) {
      wishlistItems = response.data!;
      emit(GetFavouriteSuccessState(responseEntity: response));
    });
  }

  deleteItemInWishlist(String productId) async {
    emit(DeleteItemInWishlistLoadingState());
    var either = await deleteItemInWishlistUseCase.invoke(productId);
    either.fold((error) {
      emit(DeleteItemInWishlistErrorState(failures: error));
    }, (response) {
      print("delete item in wishlist");
      getWishlist();
    });
  }
}
