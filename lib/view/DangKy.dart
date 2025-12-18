import 'package:flutter/material.dart';


class Dangky extends StatefulWidget {
  const Dangky({super.key});

  @override
  State<Dangky> createState() => _DangkyState();
}

class _DangkyState extends State<Dangky> {
  final _formKey = GlobalKey<FormState>();
  String matkhau = "";
  String matkhaunhaplai = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Đăng ký' ,style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 101, 6, 60),
        
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
                      borderRadius: BorderRadius.circular(10),
                    ), 
                    hintText: "Họ tên",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập họ tên";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), 
                    hintText: "email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập gmail";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), 
                    hintText: "Mật khẩu",
                    prefixIcon: Icon(Icons.lock),
                    suffix: Icon(Icons.remove_red_eye , color: Colors.red),
                  ),
                  onChanged: (value) => {
                    matkhau = value
                  },
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
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), 
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Mật khẩu nhập lại",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập mật khẩu nhập lại";
                    }
                    else if (value != matkhau) {
                      return "Mật khẩu nhập lại không khớp";
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
                  },
                  icon: const Icon(Icons.person, color: Colors.white), // icon bên trái
                  label: const Text("Đăng ký"), 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 101, 6, 60),
                    foregroundColor: Colors.white, 
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
