import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/GetWishlistResponseEntity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import 'custom_txt_widget.dart';

class FavouriteItemDetails extends StatelessWidget {
  const FavouriteItemDetails({required this.product, super.key});

  final GetWishlistDataEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: product.title!,
          textStyle: getSemiBoldStyle(
              color: ColorManager.primaryDark, fontSize: AppSize.s18.sp),
        ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${product.price!.toInt()}',
              textStyle: getSemiBoldStyle(
                      color: ColorManager.primaryDark, fontSize: AppSize.s18.sp)
                  .copyWith(
                letterSpacing: 0.17,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
