import 'package:exercises/features/cart/data/datasources/local/cart_local_data_source.dart';
import 'package:exercises/features/cart/data/repository/cart_repository_implementation.dart';
import 'package:exercises/features/cart/domain/repository/cart_repository.dart';
import 'package:exercises/features/cart/domain/usecases/discount_coupon.dart';
import 'package:exercises/features/cart/domain/usecases/read_cart.dart';
import 'package:exercises/features/cart/presenter/bloc/cart_bloc.dart';
import 'package:exercises/features/coupon/data/datasources/local/coupon_local_data_source.dart';
import 'package:exercises/features/coupon/data/repository/coupon_repository_implementation.dart';
import 'package:exercises/features/coupon/domain/repository/coupon_repository.dart';
import 'package:exercises/features/coupon/domain/usecases/get_coupons.dart';
import 'package:exercises/features/coupon/domain/usecases/register_coupon.dart';
import 'package:exercises/features/coupon/presenter/bloc/coupon_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  
  // Coupon
  sl.registerSingleton<CouponLocalDataSource>(
      CouponLocalDataSourceImplementation());
  sl.registerSingleton<CouponRepository>(
      CouponRepositoryImplementation(sl()));
  sl.registerSingleton( GetCoupons(sl()));
  sl.registerSingleton( RegisterCoupon(sl()));
  sl.registerFactory<CouponBloc>(() => CouponBloc(sl(),sl()));

  // Cart
  sl.registerSingleton<CartLocalDataSource>(
      CartLocalDataSourceImplementation());
  sl.registerSingleton<CartRepository>(
      CartRepositoryImplementation(sl()));
  sl.registerSingleton( ReadCart(sl()));
  sl.registerSingleton( DiscountCoupon(sl()));
  sl.registerFactory<CartBloc>(() => CartBloc(sl(),sl()));

}