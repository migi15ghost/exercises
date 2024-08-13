
import 'package:exercises/core/errors/exceptions.dart';
import 'package:exercises/features/cart/domain/entities/cart.dart';
import 'package:exercises/features/cart/domain/entities/product.dart';

abstract class CartLocalDataSource {

  Future<Cart> readCart();
}

class CartLocalDataSourceImplementation extends CartLocalDataSource {
  
  final Cart cart = const Cart(
    total: 1000.0,
    products: [
      Product(price: 1000.0)
    ],
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



}