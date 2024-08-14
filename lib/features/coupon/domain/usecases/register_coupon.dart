
import 'package:exercises/features/coupon/domain/entities/coupon.dart';
import 'package:exercises/features/coupon/domain/repository/coupon_repository.dart';
import 'package:exercises/core/usecase/usecase.dart';
import 'package:exercises/core/utils/typedef.dart';

class RegisterCoupon extends UseCaseWithParams<Coupon, String>{
  const RegisterCoupon(this._repository);

  final CouponRepository _repository;

  @override
  ResultFuture<Coupon> call(String params) async =>
   _repository.registerCoupon(params);

}