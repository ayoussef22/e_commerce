import 'package:flutter_e_commerce_c11_online/core/errors/Failures.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeTabStates{}

class HomeTabInitialState extends HomeTabStates{}
class HomeCategoryLoadingState extends HomeTabStates{}
class HomeCategoryErrorState extends HomeTabStates{
  Failures failures;
  HomeCategoryErrorState({required this.failures});
}
class HomeCategorySuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity categoryResponseEntity;
  HomeCategorySuccessState({required this.categoryResponseEntity});
}

class HomeBrandLoadingState extends HomeTabStates{}
class HomeBrandErrorState extends HomeTabStates{
  Failures failures;
  HomeBrandErrorState({required this.failures});
}
class HomeBrandSuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity brandResponseEntity;
  HomeBrandSuccessState({required this.brandResponseEntity});
}

class HomeAdsIndexChangedState extends HomeTabStates {
   int currentIndex;

  HomeAdsIndexChangedState({required this.currentIndex});
}