import 'package:exercises/core/errors/exceptions.dart';
import 'package:exercises/features/cart/domain/entities/cart.dart';
import 'package:exercises/features/cart/domain/entities/product.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';

abstract class CartLocalDataSource {
  Future<void> discountCoupon(Coupon coupon);

  Future<Cart> readCart();
}

class CartLocalDataSourceImplementation extends CartLocalDataSource {
  Cart cart = const Cart(
    total: 1000.0,
    products: [Product(price: 1000.0)],
  );

  @override
  Future<Cart> readCart() async {
    try {
      return cart;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<void> discountCoupon(Coupon coupon) async {
    try {
      double auxTotal = 0;
      for (var product in cart.products) {
        auxTotal += product.price;
      }
      auxTotal -= coupon.discount;
      cart = Cart(
        total: auxTotal,
        products: [const Product(price: 1000.0)],
      );
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
