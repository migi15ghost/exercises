import 'package:bloc/bloc.dart';
import 'package:exercises/features/cart/domain/usecases/discount_coupon.dart';
import 'package:exercises/features/cart/domain/usecases/read_cart.dart';
import 'package:equatable/equatable.dart';
import 'package:exercises/features/cart/domain/entities/cart.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc(
      this.readCart,this.discountCoupon
      )
      : super(const CartInitial()) {
    on<DiscountCouponEvent>(_discountCouponHandler);
    on<ReadCartEvent>(_readCartHandler);
  }

  final ReadCart readCart;
  final DiscountCoupon discountCoupon;

  Future<void> _discountCouponHandler(
      DiscountCouponEvent event, Emitter<CartState> emit) async {
    emit(const Updating());
    final result = await discountCoupon(event.coupon);
    result.fold(
          (failure) => emit(CartError(failure.errorMessage)),
          (_) => emit(const CartUpdated()),
    );
  }

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