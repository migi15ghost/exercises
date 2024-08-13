import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';
import 'package:exercises/features/coupon/domain/usecases/get_coupons.dart';

part 'coupon_event.dart';

part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {

  CouponBloc(this.getCoupons)
      : super(const CouponInitial()) {
    on<GetCouponsEvent>(_getCouponsHandler);
  }

  final GetCoupons getCoupons;

  Future<void> _getCouponsHandler(
      GetCouponsEvent event, Emitter<CouponState> emit) async {
    emit(const GettingCoupons());
    final result = await getCoupons();

    result.fold(
          (failure) => emit(CouponError(failure.errorMessage)),
          (coupons) => emit(CouponLoaded(coupons)),
    );
  }
  
}