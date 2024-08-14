import 'package:exercises/core/utils/typedef.dart';
import 'package:exercises/features/cart/domain/entities/cart.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';

abstract class CartRepository {
  const CartRepository();

  ResultVoid discountCoupon(Coupon coupon);

  ResultFuture<Cart> readCart();
}
