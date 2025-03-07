import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/lab/cart/cubit/cubit/cart_cubit.dart';
import 'feature/view/Screen/lab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubitA(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LabScreen(),
      ),
    );
  }
}
