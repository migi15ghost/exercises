import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';
import 'package:exercises/features/coupon/domain/usecases/get_coupons.dart';
import 'package:exercises/features/coupon/domain/usecases/register_coupon.dart';

part 'coupon_event.dart';

part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {

  CouponBloc(this.getCoupons,this.registerCoupon)
      : super(const CouponInitial()) {
    on<RegisterCouponEvent>(_registerCouponHandler);
    on<GetCouponsEvent>(_getCouponsHandler);
  }

  final RegisterCoupon registerCoupon;
  final GetCoupons getCoupons;

  Future<void> _registerCouponHandler(
      RegisterCouponEvent event, Emitter<CouponState> emit) async {
    emit(const ReadingCoupon());
    final result = await registerCoupon(event.code);

    result.fold(
          (failure) => emit(CouponError(failure.errorMessage)),
          (coupon) => emit(CouponVerificated(coupon)),
    );
  }

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