import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductRating extends StatelessWidget {
  final String productBuyers;
  final String productRating;
  const ProductRating({super.key , required this.productBuyers , required this.productRating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.primary.withValues(alpha: .3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$productBuyers Sold',
                style: getMediumStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 16.sp),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(ImageAssets.rate, width: 20.w),
            SizedBox(width: 4.w),
            Text(
              productRating,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(color: ColorManager.appBarTitleColor)
                  .copyWith(fontSize: 14.sp),
            ),
          ],
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
