
import 'package:exercises/features/coupon/domain/entities/coupon.dart';

class CouponModel extends Coupon {

  CouponModel({
    required super.name,
    required super.discount,
  });

  List<Coupon> toList = [];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'discount': discount,
    };
  }

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      name: json['name'] ?? '',
      discount: json['discount'] ?? '',
    );
  }

}