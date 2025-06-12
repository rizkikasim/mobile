import 'package:flutter/material.dart'; // Pastikan Anda mengimpor 'package:flutter/material.dart'
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerListPage extends StatelessWidget {
  const SellerListPage({super.key});

  // Data dummy untuk daftar penjual
  final List<Map<String, String>> _sellerList = const [
    {
      'imageUrl': 'https://i.ibb.co/L15k2qC/doctor-darlene-robertson.png',
      'name': 'Budi Toko Buku',
      'description': 'Menyediakan berbagai buku pelajaran dan novel.',
    },
    {
      'imageUrl': 'https://i.ibb.co/V9714bT/doctor-brooklyn-simmons.png',
      'name': 'Siti Pakaian Modis',
      'description': 'Koleksi fashion terbaru untuk pria dan wanita.',
    },
    {
      'imageUrl': 'https://i.ibb.co/M6Y91d2/doctor-savannah-nguyen.png',
      'name': 'Elektronik Jaya',
      'description': 'Gadget dan aksesoris elektronik berkualitas.',
    },
    {
      'imageUrl': 'https://i.ibb.co/L15k2qC/doctor-darlene-robertson.png',
      'name': 'Kedai Kopi Nikmat',
      'description': 'Biji kopi pilihan dari seluruh nusantara.',
    },
    {
      'imageUrl': 'https://i.ibb.co/V9714bT/doctor-brooklyn-simmons.png',
      'name': 'Furniture Minimalis',
      'description': 'Desain furniture modern dan fungsional.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
              onPressed: () {
                debugPrint('SellerListPage: Back button pressed on AppBar. Popping without result.');
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          'Daftar Penjual',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _sellerList.length,
        itemBuilder: (context, index) {
          final seller = _sellerList[index];
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                leading: CircleAvatar(
                  radius: 28.r,
                  backgroundImage: NetworkImage(seller['imageUrl']!),
                  onBackgroundImageError: (exception, stackTrace) {
                    debugPrint('SellerListPage: Error loading image for ${seller['name']}: $exception');
                  },
                ),
                title: Text(
                  seller['name']!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  seller['description']!,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[700],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 18.w, color: Colors.grey[400]),
                onTap: () {
                  // Ketika penjual diklik, kirim data penjual kembali ke ChatPage
                  final resultData = {
                    'imageUrl': seller['imageUrl'],
                    'name': seller['name'],
                  };
                  debugPrint('SellerListPage: Item tapped: ${seller['name']}. Returning data: $resultData');
                  Navigator.pop(context, resultData);
                },
              ),
              Divider(
                indent: 70.w,
                height: 1.h,
                thickness: 0.5,
                color: Colors.grey[200],
              ),
            ],
          );
        },
      ),
    );
  }
}