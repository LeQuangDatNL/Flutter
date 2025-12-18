import 'package:flutter/material.dart';

class HotelBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel List',
      home: HotelListPage(),
    );
  }
}

class HotelListPage extends StatelessWidget {
  final List<Map<String, dynamic>> hotels = [
    {
      'name': 'aNhill Boutique',
      'rating': 9.5,
      'reviews': 95,
      'location': 'Huế - Cách bạn 0,6km',
      'room': '1 suite riêng tư: 1 giường',
      'price': 109,
      'image': 'assets/images/AnhKhachSan1.jpg',
      'label': 'Bao bữa sáng',
    },
    {
      'name': 'An Nam Hue Boutique',
      'rating': 9.2,
      'reviews': 34,
      'location': 'Cư Chính - Cách bạn 0,9km',
      'room': '1 phòng khách sạn: 1 giường',
      'price': 20,
      'image': 'assets/images/AnhKhachSan2.jpg',
    },
    {
      'name': 'Huế Jade Hill Villa',
      'rating': 8.0,
      'reviews': 1,
      'location': 'Cư Chính - Cách bạn 1,3km',
      'room': '1 biệt thự nguyên căn - 1.000 m²',
      'price': 285,
      'image': 'assets/images/AnhKhachSan3.jpg',
      'label': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách khách sạn'),
        backgroundColor: Color(0xFF003580),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopHeader(),

            Expanded(
              child: ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  final hotel = hotels[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            hotel['image'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            // Placeholder khi không có ảnh thật
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 100, height: 100, color: Colors.grey[300],
                              child: Icon(Icons.hotel),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (hotel['label'] != null)
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    hotel['label'],
                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              SizedBox(height: 4),
                              Text(
                                hotel['name'],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[800],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      hotel['rating'].toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Xuất sắc - ${hotel['reviews']} đánh giá',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(hotel['location'], style: TextStyle(fontSize: 12)),
                              Text(hotel['room'], style: TextStyle(fontSize: 12)),
                              Text(
                                'US\$${hotel['price']}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border, color: Colors.blue),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      color: Color(0xFF003580), 
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          // Thanh tìm kiếm trắng
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange, width: 2),
            ),
            child: Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.black),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Xung quanh vị trí hiện tại  23 thg 10 - 24 thg 10',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          // Các nút chức năng: Sắp xếp, Lọc, Bản đồ
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton(Icons.sort, 'Sắp xếp'),
                _buildFilterButton(Icons.tune, 'Lọc'),
                _buildFilterButton(Icons.map_outlined, 'Bản đồ'),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildFilterButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue[800]),
        SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}