import 'package:exercises/core/errors/exceptions.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';

abstract class CouponLocalDataSource {
  
  Future<Coupon> registerCoupon(String coupon);

  Future<List<Coupon>> getCoupons();
}

class CouponLocalDataSourceImplementation extends CouponLocalDataSource {

  final List<Coupon> coupons = [
    const Coupon(name: 'CouponOne', discount: 100),
    const Coupon(name: 'CouponTwo', discount: 200),
    const Coupon(name: 'CouponThree', discount: 300),
  ];


  Coupon selectedCoupon = const Coupon(discount: 0, name: '');

  @override
  Future<Coupon> registerCoupon(String coupon) async{
    try {
      bool findCoupon = false;

      for (var element in coupons) {
        if (element.name == coupon) {
          selectedCoupon = element;
          findCoupon = true;
        }
      }

      if(!findCoupon){
        throw const APIException(message: 'Coupon not exists', statusCode: 400);
      }

      return selectedCoupon;

    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

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