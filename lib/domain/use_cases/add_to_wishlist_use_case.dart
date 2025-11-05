import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/AddToWishlistEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/HomeRepository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/Failures.dart';

@injectable
class AddToWishlistUseCase {
  HomeRepository homeRepository;

  AddToWishlistUseCase({required this.homeRepository});

  Future<Either<Failures, AddToWishlistEntity>> invoke(String productId) {
    return homeRepository.addToWishlist(productId);
  }
}
