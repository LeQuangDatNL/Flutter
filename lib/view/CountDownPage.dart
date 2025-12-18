import 'dart:async';
import 'package:flutter/material.dart';



class CountDownPage extends StatefulWidget {
  @override
  _CountDownPageState createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _seconds = 0;

  @override
  void dispose() {
    _timer?.cancel(); // Hủy Timer khi thoát để tránh rò rỉ bộ nhớ
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (_controller.text.isEmpty) return;
    _seconds = int.tryParse(_controller.text) ?? 0;

    _timer?.cancel(); // Nếu có Timer cũ, hủy trước khi tạo mới
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("⏰ Hết thời gian!"),
            content: Text("Countdown đã kết thúc."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  String _formatTime(int seconds) {
    final min = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bộ đếm thời gian")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Nhập số giây cần đếm",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _formatTime(_seconds),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: Text("Bắt đầu"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: Text("Dừng"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
