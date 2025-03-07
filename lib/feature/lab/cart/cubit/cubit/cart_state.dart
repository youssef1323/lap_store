part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CartGetSuccess extends CartState {
  final List<CartModel> carts;
  CartGetSuccess ({ required this.carts  });
}

final class CartDelete extends CartState {

}



