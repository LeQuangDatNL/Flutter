import 'package:flutter/material.dart';


class DangNhap extends StatefulWidget {
  const DangNhap({super.key});

  @override
  State<DangNhap> createState() => _DangNhapState();
}

class _DangNhapState extends State<DangNhap> {
  final _formKey = GlobalKey<FormState>();
  String textValue = "";
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Đăng nhập' ,style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: 
            Column(
              children: [
                SizedBox(height: 200),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ), 
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập người dùng";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ), 
                    prefixIcon: Icon(Icons.lock),
                    suffix: Icon(Icons.remove_red_eye , color: Colors.red),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập mật khẩu";
                    }
                    else if (value.length < 6) {
                      return "Mật khẩu phải có ít nhất 6 ký tự";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Nếu dữ liệu hợp lệ
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Đăng nhập thành công!")),
                      );
                    } 
                    else {
                        // Nếu nhập sai → Flutter tự động hiện thông báo lỗi dưới TextFormFie
                    }
                  },
                  icon: const Icon(Icons.login, color: Colors.white), // icon bên trái
                  label: const Text("Đăng nhập"), // text
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // màu nền xanh
                    foregroundColor: Colors.white, // màu chữ và icon
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
}
