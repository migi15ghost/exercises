import 'package:exercises/core/errors/exceptions.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';

abstract class CouponLocalDataSource {
  

  Future<List<Coupon>> getCoupons();
}

class CouponLocalDataSourceImplementation extends CouponLocalDataSource {

  final List<Coupon> coupons = [
    const Coupon(name: 'CouponOne', discount: 100),
    const Coupon(name: 'CouponTwo', discount: 200),
    const Coupon(name: 'CouponThree', discount: 300),

  ];

  @override
  Future<List<Coupon>> getCoupons() async {
    try {
      return coupons;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

}