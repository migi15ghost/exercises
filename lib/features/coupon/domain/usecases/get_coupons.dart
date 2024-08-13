
import 'package:exercises/features/coupon/domain/entities/coupon.dart';
import 'package:exercises/features/coupon/domain/repository/coupon_repository.dart';
import 'package:exercises/core/usecase/usecase.dart';
import 'package:exercises/core/utils/typedef.dart';

class GetCoupons extends UseCaseWithoutParams<List<Coupon>>{
  const GetCoupons(this._repository);

  final CouponRepository _repository;

  @override
  ResultFuture<List<Coupon>> call() async =>
   _repository.getCoupons();

}