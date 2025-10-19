import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/Failures.dart';
import '../entities/GetCartResponseEntity.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  UpdateCountInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId,int count) {
    return cartRepository.updateCountInCart(productId,count);
  }
}
