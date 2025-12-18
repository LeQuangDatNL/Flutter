import 'package:flutter/material.dart';


class GoogleClassroom extends StatelessWidget {
  const GoogleClassroom({super.key});

  @override
  Widget build(BuildContext context) {
    String url1 = 'assets/images/Anh1.png';
    String url2 = 'assets/images/Anh2.png';
    String url3 = 'assets/images/Anh3.png';
    String url4 = 'assets/images/Anh4.png';

    return Scaffold(
    appBar: AppBar(
      title: const Text('Google Classroom'),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          card("XML và ứng dụng - Nhóm 1", "2025-2026", url1,
              const Color.fromARGB(255, 85, 97, 98), "65"),
          card("XML và ứng dụng - Nhóm 2", "2024-2025", url2,
              const Color.fromARGB(255, 73, 124, 128), "30"),
          card("Lập trình hướng đối tượng", "2023-2024", url3,
              const Color.fromARGB(255, 128, 73, 78), "22"),
          card("Lập trình phân tán", "2024-2025", url4,
              const Color.fromARGB(255, 128, 111, 73), "30"),
          ],
        ),
      ),
    );
  }
  Widget card(String title1,String title2 ,String bgImage,Color bgColor ,String number ){
    number = number + " học viên";
    return 
    Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        
        decoration: BoxDecoration(
          color: bgColor,                 
          borderRadius: BorderRadius.circular(16), 
          image: DecorationImage(
            image: NetworkImage(bgImage), 
            fit: BoxFit.cover, 
          )
        ),
        child: Padding(
          // mau
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(title1 , 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(title2 , 
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(number ,
                      style: TextStyle(
                        color: Colors.white,
                      )
                    ),
                  ),
                ], 
              ),
              Icon(Icons.more_horiz , color: Colors.white,),
            ] 
          ),
        ),
      ),
    );
  }
}