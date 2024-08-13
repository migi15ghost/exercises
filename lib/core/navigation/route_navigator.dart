import 'package:exercises/features/coupon/presenter/page/coupon_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/coupon',
  routes: [
    GoRoute(
      path: '/coupon',
      builder: (BuildContext context, GoRouterState state) =>
      const CouponPage(),
    ),
  ],
);