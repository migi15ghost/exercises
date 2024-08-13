
import 'package:exercises/features/cart/domain/entities/product.dart';

class Cart {
  const Cart({
    required this.total,
    required this.products,
  });

  Cart.empty()
      : this(
          total: 0.0,
          products: [],
        );

  final double total;
  final List<Product> products;
}