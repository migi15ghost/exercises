import 'package:exercises/features/cart/presenter/page/cart_page.dart';
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
    GoRoute(
      path: '/cart',
      builder: (BuildContext context, GoRouterState state) =>
      const CartPage(),
    ),
  ],
);