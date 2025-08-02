import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/HomeRepository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/Failures.dart';
import '../entities/CategoryOrBrandResponseEntity.dart';

@injectable
class GetAllBrandsUseCase{
  HomeRepository homeRepository;
  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke(){
   return homeRepository.getAllBrands();
  }
}