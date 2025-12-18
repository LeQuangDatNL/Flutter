import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class NumberScreen extends StatefulWidget {
  const NumberScreen ({super.key});

  @override
  NumberScreenState createState() => NumberScreenState();
}

class NumberScreenState extends State<NumberScreen> {
  var number = 0;
  void resetNumber() {
    setState(() {
      number = 0;
    });
  }
  void addNumber() {
    setState(() {
      number += 1;
    });
  }
  void subtractNumber() {
    setState(() {
      number -= 1;
    });
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ứng dụng đếm số'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text("Giá trị hiện tại:", style: TextStyle(fontSize: 30, color: Colors.black)),
              SizedBox(height: 20),
              Text('$number', style: const TextStyle(fontSize: 100 , color: Colors.red)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: subtractNumber, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.remove, size: 30, color: Colors.white),
                        Text('Giảm', style: TextStyle(fontSize: 30, color: Colors.white))
                      ],
                    )
                  ),
                
                  ElevatedButton(
                    onPressed: resetNumber, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.refresh, size: 30, color: Colors.white),
                        Text('Đặt lại', style: TextStyle(fontSize: 30, color: Colors.white))
                      ],
                    )
                  ),
                  ElevatedButton(
                    onPressed: addNumber, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 30, color: Colors.white),
                        Text('Tăng', style: TextStyle(fontSize: 30, color: Colors.white))
                      ],
                    )
                  ),
                ],
              )
            ],
          )
        ),
      );      
    }
}