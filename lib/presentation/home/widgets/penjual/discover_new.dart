import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/widgets/penjual/post_card.dart';

class DiscoverNewPage extends StatelessWidget {
  const DiscoverNewPage({super.key});

  final List<Map<String, dynamic>> _discoverData = const [
    {
      'title': 'Rumah Minimalis Modern Siap Huni',
      'description':
          'Rumah baru dengan 3 kamar tidur, 2 kamar mandi, desain modern dan strategis di pusat kota. Dekat dengan fasilitas umum.',
      'price': 850000000.0,
      'location': 'Jakarta Selatan',
      'imageUrl':
          'https://placehold.co/600x400/9b59b6/ffffff?text=Rumah+Modern',
    },
    {
      'title': 'Apartemen Studio Nyaman di Pusat Kota',
      'description':
          'Studio berukuran 25m² fully furnished, dekat stasiun MRT dan pusat perbelanjaan. Cocok untuk profesional muda.',
      'price': 500000000.0,
      'location': 'Jakarta Pusat',
      'imageUrl':
          'https://placehold.co/600x400/3498db/ffffff?text=Apartemen+Studio',
    },
    {
      'title': 'Tanah Kavling Investasi Menarik',
      'description':
          'Tanah seluas 200m² di area berkembang pesat. Potensi kenaikan nilai tinggi, cocok untuk investasi jangka panjang.',
      'price': 250000000.0,
      'location': 'Bekasi',
      'imageUrl':
          'https://placehold.co/600x400/2ecc71/ffffff?text=Tanah+Kavling',
    },
    {
      'title': 'Sewa Kantor Fleksibel untuk Startup',
      'description':
          'Ruang kantor shared/private dengan fasilitas lengkap (internet, meeting room) di lokasi premium. Cocok untuk startup.',
      'price': 5000000.0,
      'location': 'Tangerang',
      'imageUrl': 'https://placehold.co/600x400/e67e22/ffffff?text=Kantor+Sewa',
    },
    {
      'title': 'Gudang Luas Strategis Dekat Tol',
      'description':
          'Gudang penyimpanan berkapasitas besar, akses mudah ke jalan tol. Ideal untuk logistik dan distribusi.',
      'price': 1200000000.0,
      'location': 'Karawang',
      'imageUrl':
          'https://placehold.co/600x400/f1c40f/000000?text=Gudang+Besar',
    },
    {
      'title': 'Ruko 3 Lantai Pinggir Jalan Raya',
      'description':
          'Ruko modern 3 lantai di lokasi komersil padat. Cocok untuk usaha retail atau kantor. Parkir luas.',
      'price': 1800000000.0,
      'location': 'Depok',
      'imageUrl':
          'https://placehold.co/600x400/7f8c8d/ffffff?text=Ruko+Komersil',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover New',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.65,
          ),
          itemCount: _discoverData.length,
          itemBuilder: (context, index) {
            final data = _discoverData[index];
            return GestureDetector(
              onTap: () {
                print('Discover Card tapped for: ${data['title']}');
              },
              child: PostCard(
                title: data['title']!,
                description: data['description']!,
                price: data['price']!,
                location: data['location']!,
                imageUrl: data['imageUrl']!,
              ),
            );
          },
        ),
      ),
    );
  }
}
