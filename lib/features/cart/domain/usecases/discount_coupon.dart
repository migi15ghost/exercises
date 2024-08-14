import 'package:exercises/core/usecase/usecase.dart';
import 'package:exercises/core/utils/typedef.dart';
import 'package:exercises/features/cart/domain/repository/cart_repository.dart';
import 'package:exercises/features/coupon/domain/entities/coupon.dart';

class DiscountCoupon extends UseCaseWithParams<void,Coupon>{
  const DiscountCoupon(this._repository);

  final CartRepository _repository;

  @override
  ResultVoid call(Coupon params) async =>
   _repository.discountCoupon(params);

}