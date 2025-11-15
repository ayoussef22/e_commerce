import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/Failures.dart';
import '../entities/GetCartResponseEntity.dart';

@injectable
class DeleteItemInCartUseCase {
  CartRepository cartRepository;

  DeleteItemInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId) {
    return cartRepository.deleteItemInCart(productId);
  }
}
