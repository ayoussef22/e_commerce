import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/get_cart_use_case.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/cart/cubit/get_cart_view_model_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartViewModel extends Cubit<GetCartStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;

  GetCartViewModel({required this.getCartUseCase, required this.deleteItemInCartUseCase,
  required this.updateCountInCartUseCase})
      : super(GetCartInitialState());

  List<GetProductCartEntity> productList = [];

  static GetCartViewModel of(BuildContext context)=> BlocProvider.of<GetCartViewModel>(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) => emit(GetCartErrorState(failures: error)),
        (response) {
      productList = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((error) => emit(DeleteItemInCartErrorState(failures: error)),
            (response) {
         // productList = response.data!.products!;
          emit(GetCartSuccessState(responseEntity: response));
        });
  }

  void updateCountInCart(String productId,int count) async {
    emit(UpdateCountInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId,count);
    either.fold((error) => emit(UpdateCountInCartErrorState(failures: error)),
            (response) {
         // productList = response.data!.products!;
          emit(GetCartSuccessState(responseEntity: response));
        });
  }
}
