import 'package:dartz/dartz.dart';
import 'package:exercises/core/errors/exceptions.dart';
import 'package:exercises/core/errors/failure.dart';
import 'package:exercises/core/utils/typedef.dart';
import 'package:exercises/features/cart/data/datasources/local/cart_local_data_source.dart';
import 'package:exercises/features/cart/domain/entities/cart.dart';
import 'package:exercises/features/cart/domain/repository/cart_repository.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';

class CartRepositoryImplementation
    implements CartRepository {
  const CartRepositoryImplementation(this._localDataSource);

  final CartLocalDataSource _localDataSource;

  @override
  ResultFuture<Cart> readCart() async {
    try {
      final result = await _localDataSource.readCart();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid discountCoupon(Coupon coupon) async{
    try {
      await _localDataSource.discountCoupon(coupon);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

}