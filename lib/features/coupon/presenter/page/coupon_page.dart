
import 'package:exercises/core/services/injection_container.dart';
import 'package:exercises/features/coupon/presenter/bloc/coupon_bloc.dart';
import 'package:exercises/features/coupon/presenter/page/widgets/coupon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CouponBloc>(
      create: (context) {
        final bloc = sl<CouponBloc>();
        bloc.add(const GetCouponsEvent());
        return bloc;
      },
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFfaf6f3),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 50,
        titleSpacing: 0,
        centerTitle: true,
        title: const Text(
          'My Coupons',
        ),
        actions: [
          InkWell(
            onTap: (){
              context.push('/cart');
            },
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  tooltip: 'Open shopping cart',
                  onPressed: () {
                  },
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: 
                      TextStyle(
                        fontSize: 17,
                        color: Colors.white),)
                      ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: BlocListener<CouponBloc, CouponState>(
        listener: (context, state) {
          if(state is CouponError){
            

          }
        },
        child: SafeArea(
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponBloc, CouponState>(
      builder: (context, state) {

        if(state is CouponLoaded){
          return ListView.builder(
            itemCount: state.coupons.length,
            itemBuilder: (BuildContext context, int index) { 
              return CouponCard(name: state.coupons[index].name, price:state.coupons[index].discount);
             },            
          );          
        }

        return const Center(
          child: Text('Ingrese su usuario y codigo'),
        );
      },
    );
  }
}