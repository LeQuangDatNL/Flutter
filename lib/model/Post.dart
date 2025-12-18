// lib/model/products.dart
class Post {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  Post({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
