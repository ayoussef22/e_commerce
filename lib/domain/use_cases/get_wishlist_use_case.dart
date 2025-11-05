import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/GetWishlistResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/HomeRepository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/Failures.dart';

@injectable
class GetWishlistUseCase{
  HomeRepository homeRepository;
  GetWishlistUseCase({required this.homeRepository});

  Future<Either<Failures, GetWishlistResponseEntity>> invoke(){
   return homeRepository.getWishlist();
  }
}