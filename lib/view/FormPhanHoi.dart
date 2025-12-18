import 'package:flutter/material.dart';

class DanhGiaForm extends StatefulWidget {
  @override
  _DanhGiaFormState createState() => _DanhGiaFormState();
}

class _DanhGiaFormState extends State<DanhGiaForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();
  int rating = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gửi phản hồi'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Họ tên
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Họ tên',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Dropdown đánh giá
            InputDecorator(
              decoration: InputDecoration(
                labelText: 'Đánh giá (1–5 sao)',
                border: OutlineInputBorder(),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: rating,
                  items: List.generate(5, (index) => index + 1)
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text('$e sao'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      rating = value ?? 4;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            // Nội dung góp ý
            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Nội dung góp ý',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Nút gửi phản hồi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  print('Tên: ${nameController.text}');
                  print('Đánh giá: $rating sao');
                  print('Nội dung: ${feedbackController.text}');
                },
                icon: Icon(Icons.send),
                label: Text('Gửi phản hồi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
