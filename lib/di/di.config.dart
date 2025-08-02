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
import '../data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i404;
import '../data/data_sources/remote_data_source/home_remote_data_source_impl.dart'
    as _i469;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/home_repository_impl.dart' as _i723;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/repository/HomeRepository.dart' as _i567;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i823;
import '../domain/use_cases/get_all_categories_use_case.dart' as _i557;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../features/auth/presentation/screens/sign_in/cubit/sign_in_view_model.dart'
    as _i889;
import '../features/auth/presentation/screens/sign_up/cubit/sign_up_view_model.dart'
    as _i4;
import '../features/main_layout/home/presentation/Cubit/home_tab_view_model.dart'
    as _i56;

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
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i384.AuthRemoteDataSource>()));
    gh.factory<_i826.LoginUseCase>(
        () => _i826.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i772.RegisterUseCase>(() =>
        _i772.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i567.HomeRepository>(() => _i723.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i404.HomeRemoteDataSource>()));
    gh.factory<_i823.GetAllBrandsUseCase>(() =>
        _i823.GetAllBrandsUseCase(homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i557.GetAllCategoriesUseCase>(() =>
        _i557.GetAllCategoriesUseCase(
            homeRepository: gh<_i567.HomeRepository>()));
    gh.factory<_i56.HomeTabViewModel>(() => _i56.HomeTabViewModel(
          categoriesUseCase: gh<_i557.GetAllCategoriesUseCase>(),
          brandsUseCase: gh<_i823.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i889.LoginViewModel>(
        () => _i889.LoginViewModel(loginUseCase: gh<_i826.LoginUseCase>()));
    gh.factory<_i4.RegisterViewModel>(() =>
        _i4.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()));
    return this;
  }
}
