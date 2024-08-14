import 'package:dartz/dartz.dart';
import 'package:exercises/core/errors/exceptions.dart';
import 'package:exercises/core/errors/failure.dart';
import 'package:exercises/core/utils/typedef.dart';
import 'package:exercises/features/coupon/data/datasources/local/coupon_local_data_source.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';
import 'package:exercises/features/coupon/domain/repository/coupon_repository.dart';

class CouponRepositoryImplementation
    implements CouponRepository {
  const CouponRepositoryImplementation(this._localDataSource);

  final CouponLocalDataSource _localDataSource;

  @override
  ResultFuture<Coupon> registerCoupon(String coupon) async {
    try {
      final result = await _localDataSource.registerCoupon(coupon);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Coupon>> getCoupons() async {
    try {
      final result = await _localDataSource.getCoupons();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

}