part of 'cart_bloc.dart';

abstract class CartState extends Equatable{
  const CartState();

  @override
  List<Object> get props => [];

}

class CartInitial extends CartState {
  const CartInitial();
}

class Updating extends CartState{
  const Updating();
  @override
  List<Object> get props => [];
}

class CartError extends CartState{
  const CartError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class CartSuccess extends CartState{
  const CartSuccess(this.order);
  final Cart order;
  @override
  List<Object> get props => [];
}