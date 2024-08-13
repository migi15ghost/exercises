import 'package:exercises/core/services/injection_container.dart';
import 'package:exercises/features/cart/presenter/bloc/cart_bloc.dart';
import 'package:exercises/features/cart/presenter/page/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) {
        final bloc = sl<CartBloc>();
        bloc.add(const ReadCartEvent());
        return bloc;
      },
      child: _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  _Page();

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        listener: (context, state) {},
        child: const SafeArea(
          child: _Body(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: width * 0.5,
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Enter Coupon",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft:  Radius.circular(10),
                          topLeft: Radius.circular(10)
                        ),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      //phoneText = value ?? '';
                      if (value == null || value.isEmpty) {
                        return 'Ingrese un numero de celular';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight:  Radius.circular(10),
                          topRight: Radius.circular(10)
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'apply',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: null,
                child: const Text(
                  'checkout',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
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
              ],
            ),
          );
        }
        return const Center(child: Text(''));
      },
    );
  }
}
