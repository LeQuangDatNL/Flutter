import 'package:app/model/Post.dart';
import 'package:dio/dio.dart';

class ApiPost {
  final Dio dio = Dio();

  Future<List<Post>> getAllPost() async {
    var response = await dio.get('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=9acaaa9e08d34ae0b8c986c6ecd4ba5f');

    if (response.statusCode == 200) {
      final body = response.data;
      final List data = body['articles'];
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
