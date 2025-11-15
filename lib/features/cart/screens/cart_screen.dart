import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/features/cart/cubit/get_cart_view_model.dart';
import 'package:flutter_e_commerce_c11_online/features/cart/cubit/get_cart_view_model_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getCartViewModel = GetCartViewModel.of(context);
    return BlocBuilder<GetCartViewModel, GetCartStates>(
      bloc: getCartViewModel,
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Cart',
              style:
                  getMediumStyle(fontSize: 20, color: ColorManager.textColor),
            ),
            centerTitle: true,
          ),
          body: state is GetCartSuccessState
              ? Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: Column(
                    children: [
                      Expanded(
                        // the list of cart items ===============
                        child: ListView.separated(
                          itemBuilder: (context, index) => CartItemWidget(
                            productCartEntity:
                                state.responseEntity.data!.products![index],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.s12.h),
                          itemCount:
                              state.responseEntity.data!.products!.length,
                        ),
                      ),
                      // the total price and checkout button========
                      TotalPriceAndCheckoutBottom(
                        totalPrice:
                            state.responseEntity.data!.totalCartPrice!.toInt(),
                        checkoutButtonOnTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
        );
      },
    );
  }
}
