// lib/model/products.dart
class Products {
  int id;
  String title;
  String description;
  String image;
  dynamic price;
  String category;
  Map<String, dynamic> rating;
  int count;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.rating,
    required this.count,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? 0,
      category: json['category'] ?? '',
      rating: json['rating'] ?? {"rate": 0, "count": 0},
      count: json['rating']?['count'] ?? 0,
    );
  }
}
