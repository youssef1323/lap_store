import 'package:dio/dio.dart';
import '../model/cart_model.dart';

class CartData {
  Dio dio = Dio();
  addCart({required productId }) async {
    var repo = await dio.post("https://elwekala.onrender.com/cart/add",

        data: {
      "nationalId": "01056710052789",
      "productId": productId,
      "quantity": "1"
    });
     print(repo.data);
  }
  
  getCart() async{
    var response =await dio.get("https://elwekala.onrender.com/cart/allProducts",

        data:
        { "nationalId":"01056710052789"});

    List listCart= response.data["products"];
    List<CartModel> carts = listCart.map(
          (e) => CartModel.fromJson(e),).toList();
    return carts;
  }

  delete({required productId})async {
    await dio.delete( "https://elwekala.onrender.com/cart/delete",

        data: {
    "nationalId": "01056710052789",
    "productId": productId,
    "quantity":"1"
    });

  }
}
