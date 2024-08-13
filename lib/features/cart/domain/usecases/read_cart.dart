import 'package:exercises/core/usecase/usecase.dart';
import 'package:exercises/core/utils/typedef.dart';
import 'package:exercises/features/cart/domain/entities/cart.dart';
import 'package:exercises/features/cart/domain/repository/cart_repository.dart';

class ReadCart extends UseCaseWithoutParams<Cart>{
  const ReadCart(this._repository);

  final CartRepository _repository;

  @override
  ResultFuture<Cart> call() async =>
   _repository.readCart();

}