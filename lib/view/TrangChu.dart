import 'package:flutter/material.dart';


class Trangchu extends StatelessWidget {
  const Trangchu({super.key});

  @override
  Widget build(BuildContext context) {
    Widget homeIcon() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.notifications),
            iconSize: 40,
            onPressed: () {
              print("Bấm vào chuông");
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 40,
            onPressed: () {
              print("Bấm vào home");
            },
          ),
        ],
      );
    }
    Widget homeHeading1() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Welcome,\n',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  TextSpan(
                    text: 'Charlie',
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    Widget homeSe(){
      return 
        TextField(
          style: TextStyle(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(  
            labelText: 'Search',
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue), 
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
          ),
      );
    }
    Widget homeHeading2(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 400,
            height: 50,
            child: Text(
              'Saved Places',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      );
    }
    Widget homeImg() {
      return Padding(
        padding: const EdgeInsets.all(1),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true, // 🔧 nếu cần GridView nằm trong Column
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), 
                child: Image.asset(
                  'assets/images/Anh1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200, 
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), 
                child: Image.asset(
                  'assets/images/Anh2.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200, 
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), 
                child: Image.asset(
                  'assets/images/Anh3.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200, 
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), 
                child: Image.asset(
                  'assets/images/Anh4.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200, 
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Chủ'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              homeIcon(),
              SizedBox(height: 20),
              homeHeading1(),
              SizedBox(height: 20),
              homeSe(),
              SizedBox(height: 20),
              homeHeading2(),
              homeImg(),
            ],
          ),
        ),
      ),
    );

  }
}