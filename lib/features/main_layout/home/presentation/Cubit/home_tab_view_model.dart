import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/Cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/assets_manager.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase categoriesUseCase;
  GetAllBrandsUseCase brandsUseCase;

  HomeTabViewModel({required this.categoriesUseCase, required this.brandsUseCase})
      : super(HomeTabInitialState());

  List<CategoryOrBrandEntity> categoryList=[];
  List<CategoryOrBrandEntity> brandList=[];

  int currentIndex = 0;
  late Timer timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  void getAllCategories() async {
    emit(HomeBrandLoadingState());
    var either = await categoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeCategoryErrorState(failures: error));
    }, (response) {
      categoryList=response.data!;
      emit(HomeCategorySuccessState(categoryResponseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(HomeBrandLoadingState());
    var either = await brandsUseCase.invoke();
    either.fold((error) {
      emit(HomeBrandErrorState(failures: error));
    }, (response) {
      brandList=response.data!;
      emit(HomeBrandSuccessState(brandResponseEntity: response));
    });
  }

  void startImageSwitching() {
    timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
        currentIndex = (currentIndex + 1) % adsImages.length;
        emit(HomeAdsIndexChangedState(currentIndex: currentIndex));
    });
  }
}
