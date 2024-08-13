import 'package:bloc/bloc.dart';
import 'package:exercises/features/cart/domain/usecases/read_cart.dart';
import 'package:equatable/equatable.dart';
import 'package:exercises/features/cart/domain/entities/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc(
      this.readCart,
      )
      : super(const CartInitial()) {
    on<ReadCartEvent>(_readCartHandler);
  }

  final ReadCart readCart;

  Future<void> _readCartHandler(
      ReadCartEvent event, Emitter<CartState> emit) async {
    emit(const Updating());
    final result = await readCart();
    result.fold(
          (failure) => emit(CartError(failure.errorMessage)),
          (order) => emit(CartSuccess(order)),
    );
  }



}