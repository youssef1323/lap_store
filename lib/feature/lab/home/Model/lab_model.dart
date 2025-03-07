class ProductModel {
  final String id;
  final String title;
  final num price;
  final String description;
  final String image;
  final String category;
  final String status;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category,
      required this.status});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      status: json['status'] ?? '',
      title: json['name'] ?? '',
      price: json['price'] ?? 0.0,
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }
}
