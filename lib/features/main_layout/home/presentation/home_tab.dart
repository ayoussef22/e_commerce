import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/core/resources/color_manager.dart';
import 'package:flutter_e_commerce_c11_online/di/di.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/Cubit/home_tab_states.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/Cubit/home_tab_view_model.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/widgets/custom_category_or_brand_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.startImageSwitching();
    viewModel.getAllCategories();
    viewModel.getAllBrands();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAdsWidget(
                adsImages: viewModel.adsImages,
                currentIndex: viewModel.currentIndex,
              ),
              Column(
                children: [
                  CustomSectionBar(sectionNname: 'Categories', function: () {}),
                  viewModel.categoryList.isNotEmpty
                      ? SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryOrBrandWidget(
                                  categoryOrBrand: viewModel.categoryList[index]);
                            },
                            itemCount: viewModel.categoryList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.darkPrimary,
                          ),
                        ),
                  SizedBox(height: 12.h),
                  CustomSectionBar(sectionNname: 'Brands', function: () {}),
                  viewModel.brandList.isNotEmpty ?
                  SizedBox(
                    height: 270.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomCategoryOrBrandWidget(categoryOrBrand: viewModel.brandList[index]);
                      },
                      itemCount: viewModel.brandList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  ):
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.darkPrimary,
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
