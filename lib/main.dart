import 'package:app/view/TrangChu.dart';
import 'package:flutter/material.dart';
import 'package:app/view/ColorScreen.dart'; 
import 'package:app/view/DangNhap.dart'; 
import 'package:app/view/DangKy.dart';
import 'package:app/view/DanhGiaBMI.dart';
import 'package:app/view/HotelBooking.dart';
import 'package:app/view/GoogleClassroom.dart';
import 'package:app/view/NumberScreen.dart';
import 'package:app/view/MyProduct.dart';
import 'package:app/view/MyPost.dart';
import 'package:app/view/IntroductoryOeschinenLake.dart';
import 'package:app/view/FormPhanHoi.dart';
import 'package:app/view/DangNhapVaoProfile.dart';
import 'package:app/api/ApiPost.dart';
import 'package:app/api/ApiProduct.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp(
    DevicePreview(
      enabled: true, // bật preview
      builder: (context) => MyApp(), 
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NameListPage(),
    );
  }
}

class NameListPage extends StatelessWidget {
  final List<String> namesProjcet = 
  [
    'ColorScreen', 
    'DangNhap',
    'DangKy',
    'DanhGiaBMI',
    'TrangChu',
    'HotelBooking',
    'GoogleClassroom',
    'NumberScreen',
    'MyProduct',
    'MyPost',
    'FormPhanHoi',
    'IntroductoryOeschinenLake',
    'DangNhapVaoProfile',
  ];
  final List<Icon> iconProjcet = 
  [
    Icon(Icons.color_lens),
    Icon(Icons.login),
    Icon(Icons.app_registration),
    Icon(Icons.monitor_weight),
    Icon(Icons.home),
    Icon(Icons.hotel),
    Icon(Icons.class_),
    Icon(Icons.format_list_numbered),
    Icon(Icons.shopping_cart),
    Icon(Icons.article),
    Icon(Icons.feedback),
    Icon(Icons.landscape),
    Icon(Icons.person),
  ];

  final ApiPost apiPost = ApiPost();
  final ApiProduct apiProduct = ApiProduct();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách màn hình')),
      body: ListView.builder(
        itemCount: namesProjcet.length,
        itemBuilder: (context, index) {
          return 
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Icon(
                iconProjcet[index].icon,
                color: Colors.blue.shade700,
              ),
            ),
            title: Text(
              namesProjcet[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Widget page;
              switch (namesProjcet[index]) {
                case 'ColorScreen':
                  page = ColorScreen();
                  break;
                case 'DangNhap': 
                  page = DangNhap();  
                  break;
                case 'DangKy':
                  page = Dangky();
                  break;
                case 'DanhGiaBMI':
                  page = DanhGiaBMI();
                  break;
                case 'TrangChu':
                  page = Trangchu();
                  break;
                case 'HotelBooking':
                  page = HotelListPage();
                  break;
                case 'GoogleClassroom':
                  page = GoogleClassroom();
                  break;
                case 'NumberScreen':
                  page = NumberScreen();
                  break;
                case 'MyProduct':
                  page = MyProduct(api: apiProduct);
                  break;
                case 'MyPost':
                  page = MyPost(api: apiPost);
                  break;
                case "FormPhanHoi":
                  page = DanhGiaForm();
                  break;
                case "IntroductoryOeschinenLake":
                  page = IntroductoryOeschinenLake();
                  break;
                case "DangNhapVaoProfile":
                  page = LoginPage();
                  break;
                default:
                  page = Scaffold(body: Center(child: Text("Màn hình đang phát triển")));
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
          );
        },
      ),
    );
  }
}