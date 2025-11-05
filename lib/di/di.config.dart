// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i384;
import '../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i558;
import '../data/data_sources/remote_data_source/cart_remote_data_source.dart'
    as _i769;
import '../data/data_sources/remote_data_source/cart_remote_data_source_impl.dart'
    as _i784;
import '../data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i404;
import '../data/data_sources/remote_data_source/home_remote_data_source_impl.dart'
    as _i469;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/cart_repository_impl.dart' as _i47;
import '../data/repository/home_repository_impl.dart' as _i723;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/repository/cart_repository.dart' as _i130;
import '../domain/repository/HomeRepository.dart' as _i567;
import '../domain/use_cases/add_to_cart_use_case.dart' as _i994;
import '../domain/use_cases/add_to_wishlist_use_case.dart' as _i168;
import '../domain/use_cases/delete_item_in_cart_use_case.dart' as _i1013;
import '../domain/use_cases/delete_item_in_wishlist_use_case.dart' as _i857;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i823;
import '../domain/use_cases/get_all_categories_use_case.dart' as _i557;
import '../domain/use_cases/get_all_products_use_case.dart' as _i960;
import '../domain/use_cases/get_cart_use_case.dart' as _i487;
import '../domain/use_cases/get_wishlist_use_case.dart' as _i861;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/update_count_in_cart_use_case.dart' as _i668;
import '../features/auth/presentation/screens/sign_in/cubit/sign_in_view_model.dart'
    as _i889;
import '../features/auth/presentation/screens/sign_up/cubit/sign_up_view_model.dart'
    as _i4;
import '../features/cart/cubit/get_cart_view_model.dart' as _i762;
import '../features/main_layout/favourite/presentation/cubit/favourite_screen_view_model.dart'
    as _i1071;
import '../features/main_layout/home/presentation/Cubit/home_tab_view_model.dart'
    as _i56;
import '../features/products_screen/presentation/cubit/product_screen_view_model.dart'
    as _i110;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i404.HomeRemoteDataSource>(() =>
        _i469.HomeRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i384.AuthRemoteDataSource>(() =>
        _i558.AuthRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i769.CartRemoteDataSource>(() =>
        _i784.CartRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i384.AuthRemoteDataSource>()));
    gh.factory<_i826.LoginUseCase>(
        () => _i826.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i772.RegisterUseCase>(() =>
        _i772.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i567.HomeRepository>(() => _i723.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i404.HomeRemoteDataSource>()));
    gh.factory<_i130.CartRepository>(() => _i47.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i769.CartRemoteDataSource>()));
    gh.factory<_i823.GetAllBrandsUseCase>(() =>
        _i823.GetAllBrandsUseCase(homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i557.GetAllCategoriesUseCase>(() =>
        _i557.GetAllCategoriesUseCase(
            homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i960.GetAllProductsUseCase>(() => _i960.GetAllProductsUseCase(
        homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i994.AddToCartUseCase>(() =>
        _i994.AddToCartUseCase(homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i168.AddToWishlistUseCase>(() =>
        _i168.AddToWishlistUseCase(homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i861.GetWishlistUseCase>(() =>
        _i861.GetWishlistUseCase(homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i857.DeleteItemInWishlistUseCase>(() =>
        _i857.DeleteItemInWishlistUseCase(
            homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i56.HomeTabViewModel>(() => _i56.HomeTabViewModel(
          categoriesUseCase: gh<_i557.GetAllCategoriesUseCase>(),
          brandsUseCase: gh<_i823.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i487.GetCartUseCase>(
        () => _i487.GetCartUseCase(cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i1013.DeleteItemInCartUseCase>(() =>
        _i1013.DeleteItemInCartUseCase(
            cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i668.UpdateCountInCartUseCase>(() =>
        _i668.UpdateCountInCartUseCase(
            cartRepository: gh<_i130.CartRepository>()));
    gh.factory<_i1071.FavouriteScreenViewModel>(() =>
        _i1071.FavouriteScreenViewModel(
          wishlistUseCase: gh<_i861.GetWishlistUseCase>(),
          deleteItemInWishlistUseCase: gh<_i857.DeleteItemInWishlistUseCase>(),
        ));
    gh.factory<_i110.ProductScreenViewModel>(() => _i110.ProductScreenViewModel(
          productsUseCase: gh<_i960.GetAllProductsUseCase>(),
          addToCartUseCase: gh<_i994.AddToCartUseCase>(),
          addToWishlistUseCase: gh<_i168.AddToWishlistUseCase>(),
        ));
    gh.factory<_i889.LoginViewModel>(
        () => _i889.LoginViewModel(loginUseCase: gh<_i826.LoginUseCase>()));
    gh.factory<_i4.RegisterViewModel>(() =>
        _i4.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()));
    gh.factory<_i762.GetCartViewModel>(() => _i762.GetCartViewModel(
          getCartUseCase: gh<_i487.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i1013.DeleteItemInCartUseCase>(),
          updateCountInCartUseCase: gh<_i668.UpdateCountInCartUseCase>(),
        ));
    return this;
  }
}
