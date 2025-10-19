import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/add_to_cart_use_case.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductScreenStates> {
  GetAllProductsUseCase productsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductScreenViewModel(
      {required this.productsUseCase, required this.addToCartUseCase})
      : super(ProductInitialState());

  //todo : hold data & handle logic
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductScreenViewModel of(BuildContext context) =>
      BlocProvider.of<ProductScreenViewModel>(context);

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await productsUseCase.invoke();
    either.fold((error) {
      emit(ProductErrorState(failures: error));
    }, (response) {
      productsList = response.data!;
      emit(ProductSuccessState(responseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToCartErrorState(failures: error));
    }, (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      print('num of product $numOfCartItems');
      emit(AddToCartSuccessState(responseEntity: response));
    });
  }
}
