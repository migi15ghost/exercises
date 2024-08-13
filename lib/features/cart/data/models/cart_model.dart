
import 'package:exercises/features/cart/domain/entities/cart.dart';

class CartModel extends Cart {

  CartModel({
    required super.total,
    required super.products,
  });

  List<Cart> toList = [];

  Map<String, dynamic> toJson() {
    return {
      'total': total,
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      total: json['total'] ?? 0.0,
      products: [],
    );
  }

}