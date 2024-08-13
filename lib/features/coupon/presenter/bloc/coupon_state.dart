part of 'coupon_bloc.dart';

abstract class CouponState extends Equatable{
  const CouponState();

  @override
  List<Object> get props => [];

}

class CouponInitial extends CouponState {
  const CouponInitial();
}

class CouponError extends CouponState{
  const CouponError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class GettingCoupons extends CouponState{
  const GettingCoupons();

  @override
  List<Object> get props => [];
}

class CouponLoaded extends CouponState{
  const CouponLoaded(this.coupons);

  final List<Coupon> coupons;

  @override
  List<Object> get props => [];
}

