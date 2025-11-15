import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/HomeRepository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/Failures.dart';
import '../entities/ProductResponseEntity.dart';

@injectable
class GetAllProductsUseCase{
  HomeRepository homeRepository;
  GetAllProductsUseCase({required this.homeRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke(){
   return homeRepository.getAllProducts();
  }
}