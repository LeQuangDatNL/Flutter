import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';


class ColorScreen extends StatefulWidget {
  const ColorScreen ({super.key});

  @override
  ColorScreenState createState() => ColorScreenState();
}

class ColorScreenState extends State<ColorScreen> {
  Color currentColor = Colors.blue;
  String colorName = "Xanh";
  void resetColor() {
    setState(() {
      currentColor = Colors.blue;
      colorName = "Xanh";
    });
  }
  void changeColor() {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.purple,
      Colors.grey,
    ];

    final names = [
      "Đỏ",
      "Xanh lá",
      "Cam",
      "Vàng",
      "Hồng",
      "Tím",
      "Xám"
    ];
    int index = Random().nextInt(colors.length);

    setState(() {
      currentColor = colors[index];
      colorName = names[index];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Color Screen'),
      ),
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Màu hiện tại",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),  
            ),
            Text(
              "$colorName",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),  
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: changeColor,
                  child: const Text("Đổi màu"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: resetColor,
                  child: const Text("Đặt lại"),
                ),
                const SizedBox(width: 20),
              ],
            )
          ],
        )
      ); 
    }
}