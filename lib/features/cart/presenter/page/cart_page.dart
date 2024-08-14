import 'package:exercises/core/services/injection_container.dart';
import 'package:exercises/features/cart/presenter/bloc/cart_bloc.dart';
import 'package:exercises/features/cart/presenter/page/widgets/product_cart.dart';
import 'package:exercises/features/coupon/presenter/bloc/coupon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (_) => sl<CartBloc>()..add(const ReadCartEvent()),
        ),
        BlocProvider<CouponBloc>(
          create: (_) => sl<CouponBloc>(),
        ),
      ],
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xFFfaf6f3),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 50,
        titleSpacing: 0,
        centerTitle: true,
        title: const Text(
          'My Cart',
        ),
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartUpdated) {
            context.read<CartBloc>().add(const ReadCartEvent());
          }
        },
        child: const SafeArea(
          child: _Body(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        width: width,
        constraints: const BoxConstraints(
          minWidth: 700,
          maxWidth: 700,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartSuccess) {
                return Text('Total: ${state.order.total}');
              }
              return const Text('Total: 0.00');
            }),
          ],
        ),
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final codeText = useTextEditingController();
    double width = MediaQuery.sizeOf(context).width;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          return Center(
            child: Container(
              width: width,
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: height * 0.8,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.order.products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              price: state.order.products[index].price,
                            );
                          }),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.5,
                          height: 40,
                          constraints: const BoxConstraints(
                            maxWidth: 400,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: "Enter Coupon",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                borderSide: BorderSide(),
                              ),
                            ),
                            controller: codeText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some coupon';
                              }
                              return null;
                            },
                          ),
                        ),
                        BlocConsumer<CouponBloc, CouponState>(
                            listener: (context, state) {
                          if (state is CouponVerificated) {
                            codeText.text = '';
                            context
                                .read<CartBloc>()
                                .add(DiscountCouponEvent(state.coupon));
                          }
                        }, builder: (context, state) {
                          return Container(
                            width: width * 0.2,
                            height: 40,
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Center(
                              child: state is ReadingCoupon
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          context.read<CouponBloc>().add(
                                              RegisterCouponEvent(
                                                  codeText.text));
                                        }
                                      },
                                      child: const Text(
                                        'apply',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  BlocBuilder<CouponBloc, CouponState>(
                      builder: (context, state) {
                    if (state is CouponError) {
                      return const Text('The coupon code entered is not valid.',
                          style: TextStyle(color: Colors.red));
                    }
                    if (state is CouponVerificated) {
                      return Text(
                        'coupon #${state.coupon.name} applied.',
                        style: const TextStyle(color: Colors.green),
                      );
                    }

                    return const Text('');
                  }),
                ],
              ),
            ),
          );
        }
        return const Center(child: Text(''));
      },
    );
  }
}
