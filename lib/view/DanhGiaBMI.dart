import 'package:flutter/material.dart';


class DanhGiaBMI extends StatefulWidget {
  const DanhGiaBMI({super.key});

  @override
  State<DanhGiaBMI> createState() => _DanhGiaBMIState();
}

class _DanhGiaBMIState extends State<DanhGiaBMI> {
  final _formKey = GlobalKey<FormState>();
  double ChieuCao = 0;
  double CanNang = 0;
  double? bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tính chỉ số BM' ,style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: 
            Column(
              children: [

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                    ), 
                    labelText: 'Chiều cao (m)',
                    hintText: "Chiều cao (m)",
                    prefixIcon: Icon(Icons.height),
                  ),

                  onChanged: (value) => ChieuCao = double.parse(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "nhập chiều cao";
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
                    labelText: "cân nặng (kg)",
                    hintText: "cân nặng (kg)",
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                  onChanged: (value) => CanNang = double.parse(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nhập cân nặng";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Nếu dữ liệu hợp lệ
                      setState(() {
                        bmi = CanNang / (ChieuCao * ChieuCao);
                      });
                    } 
                  },
                  icon: const Icon(Icons.person, color: Colors.white), // icon bên trái
                  label: const Text("Đánh giá BMI"), // text bên phải
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white, 
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                if (bmi != null) ...[
                  Text(
                    "BMI của bạn: ${bmi!.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  if (bmi! < 18.5)
                    Text("Thiếu cân"),

                  if (bmi! >= 18.5 && bmi! < 24.9)
                    Text("Bình thường"),

                  if (bmi! >= 25 && bmi! < 29.9)
                    Text("Thừa cân"),

                  if (bmi! >= 30)
                    Text("Béo phì"),
                ]
              ],
            ),
          ),
        ),
      );
    }
}
