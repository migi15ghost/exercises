import 'package:exercises/core/utils/typedef.dart';
import 'package:exercises/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  const CartRepository();

  ResultFuture<Cart> readCart();
}
