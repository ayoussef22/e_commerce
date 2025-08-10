import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../widgets/product_description.dart';
import '../widgets/product_label.dart';
import '../widgets/product_rating.dart';

class ProductDetails extends StatelessWidget {
  final ProductEntity product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ImageSlideshow(
              children: product.images!
                  .map((url) => Image.network(
                        url,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 24.h,
            ),
            ProductLabel(
                productName: product.title ?? '',
                productPrice: 'EGP ${product.price}'),
            SizedBox(
              height: 16.h,
            ),
            ProductRating(
                productBuyers: '${product.sold} Sold',
                productRating: '${product.ratingsAverage}'),
            SizedBox(
              height: 16.h,
            ),
            ProductDescription(productDescription: product.description ?? ''),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color:
                                  ColorManager.primary.withValues(alpha: 153))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('EGP ${product.price}',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    label: 'Add to cart',
                    onTap: () {},
                    prefixIcon: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: ColorManager.white,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
