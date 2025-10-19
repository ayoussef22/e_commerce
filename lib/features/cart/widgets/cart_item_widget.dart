import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/routes_manager/routes.dart';
import '../../../core/widget/product_counter.dart';
import '../../../domain/entities/GetCartResponseEntity.dart';
import '../cubit/get_cart_view_model.dart';

class CartItemWidget extends StatelessWidget {
  GetProductCartEntity productCartEntity;

  CartItemWidget({required this.productCartEntity});

  @override
  Widget build(BuildContext context) {
    final getCartViewModel = GetCartViewModel.of(context);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productDetails),
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border:
              Border.all(color: ColorManager.primary.withValues(alpha: 0.3)),
        ),
        child: Row(children: [
          // display image in the container
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                  color: ColorManager.primary.withValues(alpha: 0.3)),
            ),
            child: Image.network(
              productCartEntity.product?.imageCover ?? '',
              fit: BoxFit.cover,
              height: isPortrait ? height * 0.142 : height * 0.23,
              width: isPortrait ? width * 0.29 : 165.w,
            ),
          ),
          // SizedBox(width: 8.w),
          // display details product=========================
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w,
                vertical: AppPadding.p8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // title and delete button ==
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          productCartEntity.product?.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // todo : delete
                          getCartViewModel.deleteItemInCart(
                              productCartEntity.product?.id ?? '');
                        },
                        child: Image.asset(
                          IconsAssets.icDelete,
                          color: ColorManager.textColor,
                          height: 22.h,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 7.h),
                  // display price and quantity =================
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${productCartEntity.price}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp),
                        ),
                      ),
                      ProductCounter(
                        add: (int count) {
                           count=productCartEntity.count!.toInt();
                          count++;
                          getCartViewModel.updateCountInCart(productCartEntity.product?.id ?? '', count);
                        },
                        productCounter: productCartEntity.count!.toInt(),
                        remove: (int count) {
                           count = productCartEntity.count!.toInt();
                          count--;
                          getCartViewModel.updateCountInCart(
                              productCartEntity.product?.id ?? '', count);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
