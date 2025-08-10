import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductScreenStates> {
  GetAllProductsUseCase productsUseCase;

  ProductScreenViewModel({required this.productsUseCase})
      : super(ProductInitialState());

  //todo : hold data & handle logic
  List<ProductEntity> productsList = [];

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
}
