import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../lab/cart/cubit/cubit/cart_cubit.dart';
import '../../lab/home/lap_cubit/lab_cubit.dart';
import '../../lab/cart/view/cart_screen.dart';

class LabScreen extends StatelessWidget {
  const LabScreen({super.key});

  get productId => productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LabCubit()..getDataCubit(),
        child: Scaffold(
          backgroundColor: Colors.green[800],
          floatingActionButton: FloatingActionButton
            (onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));
          },
            backgroundColor: Colors.black87,
            child: const Icon(Icons.shopping_cart_outlined , color: Colors.green,),  ),
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text("Lab Store" ,style: TextStyle(color: Colors.green),),
              centerTitle: true,
            ),
            body: BlocBuilder<LabCubit, LabState>(builder: (context, state) {
              if (state is TestSuccessState) {
                return ListView.builder(
                  itemCount: state.laps.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black87,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.network(
                              state.laps[index].image,
                              height: 150,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(state.laps[index].title),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(state.laps[index].category),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green,
                                  ),
                                  child: Center(
                                      child: Text(state.laps[index].status))),
                              IconButton(
                                color: Colors.amber,
                                  splashColor: Colors.lightGreen,
                                  onPressed: () {
                                    BlocProvider.of<CartCubitA>(context)
                                        .addCartCubit(productId: productId);
                                  },
                                  icon: const Icon(Icons.shopping_cart_outlined))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(state.laps[index].description),
                        ],
                      ),
                    );
                  },
                );
              }
              return const CircularProgressIndicator();
            })));
  }
}
