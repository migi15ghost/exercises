class Product {
  const Product({
    required this.price,
  });

  Product.empty()
      : this(
          price: 0.0,
        );

  final double price;
}
