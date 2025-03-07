import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_store_task/feature/lab/cart/model/cart_model.dart';
import '../cubit/cubit/cart_cubit.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CartCubitA()..getCartCubit(),
    child: Scaffold(
      backgroundColor: Colors.green[800],
      appBar:
      AppBar(title: const Text("Cart",style: TextStyle(color: Colors.black87)),backgroundColor: Colors.green[900],),
      body: BlocConsumer<CartCubitA,CartState>(builder: (context, state) {
        if(state is CartGetSuccess){
          return ListView.builder(itemBuilder: (context, index) {
            return Column(
              children: [
                Image.network(state.carts[index].image),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      CartCubitA.get(context).deleteCubit(productId: CartModel.id);
                    },
                        icon: const Icon(Icons.delete))
                  ],
                )
              ],
            );
          },);
        }
        return const Center(child:  CircularProgressIndicator(color: Colors.amber,));
      }, listener: (context, state) {

      },),
    ),
    ) ;
  }
}
