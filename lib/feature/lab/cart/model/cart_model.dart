class CartModel {

final String  image  ;
final String  description  ;
final String  name  ;
final String  category  ;
final String  price ;
final String  quantity ;
final String  totalPrice  ;

  static var id;

  CartModel({required this.image, required this.description, required this.name, required this.category, required this.price, required this.quantity, required this.totalPrice});

  factory CartModel.fromJson (Map<String, dynamic> json){
  return CartModel(
      image: json ["image"],
      description: json ["description"],
      name: json["name"],
      category:json ["category"],
      price: json["price"],
      quantity:json['quantity'],
      totalPrice:json  ["totalPrice"]);
}

}