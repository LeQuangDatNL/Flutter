import 'package:flutter/material.dart';
import 'package:app/model/Post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          post.title.isNotEmpty ? post.title : "Chi tiết bài viết",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post.urlToImage.isNotEmpty &&
                post.urlToImage.startsWith("http"))
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  post.urlToImage,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.grey[300],
                      child: const Center(child: Text("Không tải được ảnh")),
                    );
                  },
                ),
              ),

            const SizedBox(height: 16),

            // ⭐ Tiêu đề
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ⭐ Mô tả
            Text(
              post.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // ⭐ Nội dung bài
            Text(
              post.content,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
