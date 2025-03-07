part of 'lab_cubit.dart';

sealed class LabState {}

final class LabInitial extends LabState {}

final class TestLoadingState extends LabState {}

final class TestFailureState extends LabState {}

final class TestSuccessState extends LabState {
  final List<ProductModel> laps;
  TestSuccessState({required this.laps});
}

