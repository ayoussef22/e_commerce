import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/cubit/product_screen_view_model.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsViewModel = ProductScreenViewModel.of(context);
    return BlocBuilder<ProductScreenViewModel, ProductScreenStates>(
      bloc: productsViewModel,
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: productsViewModel.productsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 7 / 9,
                    ),
                    itemBuilder: (context, index) {
                      return CustomProductWidget(
                          productEntity: productsViewModel.productsList[index]);
                    },
                    scrollDirection: Axis.vertical,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
