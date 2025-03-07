import 'package:dio/dio.dart';
import '../Model/lab_model.dart';

class ProductData {
  Dio dio = Dio();
  getData() async {
    var response =
        await dio.get("https://elwekala.onrender.com/product/Laptops");
    List jsonBody = response.data["product"];
    List<ProductModel> laps =
        jsonBody.map((e) => ProductModel.fromJson(e)).toList();
    return laps;
  }
}








































// import 'package:dio/dio.dart';
// import 'package:nti_api_app/feature/lab/home/Model/lab_model.dart';

// class ProductData {
//   Dio dio = Dio();
//   getData() async {
//     var response =
//         await dio.get("https://elwekala.onrender.com/product/Laptops");
//     List jsonBody = response.data["product"];
//     List<ProductModel> product =
//         jsonBody.map((e) => ProductModel.fromJson(e)).toList();
//     return product;
//   }
// }


