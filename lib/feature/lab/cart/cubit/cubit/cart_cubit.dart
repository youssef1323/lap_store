import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../model/cart_model.dart';
import '../../data/cart_data.dart';

part 'cart_state.dart';

class CartCubitA extends Cubit<CartState> {
  static CartCubitA get(context) => BlocProvider.of(context);
  CartCubitA() : super(CartInitial());

  CartData cart = CartData();
  addCartCubit({required productId}) {
    emit(CartLoading());
    cart.addCart(productId: productId);
    emit(CartSuccess());
  }

  getCartCubit()async{
    emit(CartLoading());
    var carts = await cart.getCart();
    emit(CartGetSuccess(carts: carts));
  }

  deleteCubit({required productId})async{
    emit( CartLoading());
    await cart.delete(productId: productId);
    emit(CartDelete());
    getCartCubit();
  }
}
