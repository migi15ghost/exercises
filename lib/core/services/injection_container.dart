import 'package:exercises/features/coupon/data/datasources/local/coupon_local_data_source.dart';
import 'package:exercises/features/coupon/data/repository/coupon_repository_implementation.dart';
import 'package:exercises/features/coupon/domain/repository/coupon_repository.dart';
import 'package:exercises/features/coupon/domain/usecases/get_coupons.dart';
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
  sl.registerFactory<CouponBloc>(() => CouponBloc(sl()));

}