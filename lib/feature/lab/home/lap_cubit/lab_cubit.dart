import 'package:bloc/bloc.dart';

import '../Model/lab_model.dart';
import '../data/lab_data.dart';

part 'lab_state.dart';

class LabCubit extends Cubit<LabState> {
  LabCubit() : super(LabInitial());
  ProductData productData = ProductData();

   getDataCubit()async{
     emit(TestLoadingState());
     var success =await productData.getData();
     emit(TestSuccessState(laps:success));
}
}


