

part of 'coupon_bloc.dart';

abstract class CouponEvent  extends Equatable{
  const CouponEvent();

  @override
  List<Object> get props => [];
}

class GetCouponsEvent extends CouponEvent{
  const GetCouponsEvent();

  @override
  List<Object> get props => [];

}
