import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/GetWishlistResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/mappers.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/favourite/presentation/cubit/favourite_screen_view_model.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/cubit/product_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../cart/cubit/get_cart_view_model.dart';
import 'add_to_cart_button.dart';
import 'favourite_item_details.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.product});

  final GetWishlistDataEntity product;

  @override
  Widget build(BuildContext context) {
    final productVm=ProductScreenViewModel.of(context);
    final cartVM = GetCartViewModel.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetails,
            arguments: product.toProductEntity());
      },
      child: Container(
        height: AppSize.s135.h,
        padding: EdgeInsets.only(right: AppSize.s8.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16.r),
            border:
                Border.all(color: ColorManager.primary.withValues(alpha: .3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s16.r),
                  border: Border.all(
                      color: ColorManager.primary.withValues(alpha: .6))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                child: CachedNetworkImage(
                  width: AppSize.s120.w,
                  height: AppSize.s135.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? '',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: AppSize.s8.w),
                    child: FavouriteItemDetails(
                      product: product,
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    //Todo : Delete Item
                    FavouriteScreenViewModel.of(context).deleteItemInWishlist(product.id!);
                  },
                  child: Image.asset(
                    IconsAssets.icDelete,
                    color: ColorManager.textColor,
                    height: 22.h,
                  ),
                ),
                SizedBox(height: AppSize.s14.h),
                AddToCartButton(
                  onPressed: ()async {
                    //TODO:add product to cart
                     await productVm.addToCart(product.id??'');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            '✅ Product added to cart successfully'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: ColorManager.primary,
                      ),
                    );
                    cartVM.getCart();
                  },
                  text: AppConstants.addToCart,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
