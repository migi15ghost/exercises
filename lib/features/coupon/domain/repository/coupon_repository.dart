import 'package:exercises/features/coupon/domain/entities/coupon.dart';
import 'package:exercises/core/utils/typedef.dart';

abstract class CouponRepository{
  const CouponRepository();

  ResultFuture<Coupon> registerCoupon(String coupon);

  ResultFuture<List<Coupon>> getCoupons();

}