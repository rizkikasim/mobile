import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String location;
  final String imageUrl;

  const PostCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.imageUrl,
  }) : super(key: key);

  String _formatCurrency(double amount) {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatCurrency.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              imageUrl,
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100.h,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 40.w,
                      color: Colors.grey[600],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            _formatCurrency(price),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFF6B00),
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 12.sp,
                color: Colors.grey[600],
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PostCardFeed extends StatelessWidget {
  const PostCardFeed({super.key});

  final List<Map<String, dynamic>> _postData = const [
    {
      'title': 'Promo Spesial: Sepatu Sneakers Nyaman!',
      'description':
          'Sepatu sneakers terbaru dengan desain modern dan kenyamanan maksimal. Cocok untuk aktivitas sehari-hari dan olahraga ringan.',
      'price': 450000.0,
      'location': 'Bandung',
      'imageUrl':
          'https://via.placeholder.com/600x400/FF5733/FFFFFF?text=Sneakers',
    },
    {
      'title': 'Jasa Desain Grafis Profesional',
      'description':
          'Menerima pesanan desain logo, brosur, banner, dan kebutuhan visual lainnya. Hasil cepat dan berkualitas tinggi.',
      'price': 1500000.0,
      'location': 'Jakarta',
      'imageUrl':
          'https://via.placeholder.com/600x400/33FF57/FFFFFF?text=Desain+Grafis',
    },
    {
      'title': 'Diskon Pakaian Musim Panas!',
      'description':
          'Koleksi pakaian musim panas terbaru dengan diskon menarik. Bahan adem dan nyaman untuk gaya santai Anda.',
      'price': 120000.0,
      'location': 'Surabaya',
      'imageUrl':
          'https://via.placeholder.com/600x400/3366FF/FFFFFF?text=Pakaian',
    },
    {
      'title': 'Kursus Online: Pemrograman Flutter dari Nol',
      'description':
          'Pelajari dasar-dasar Flutter dan bangun aplikasi mobile pertama Anda. Cocok untuk pemula tanpa pengalaman coding.',
      'price': 2500000.0,
      'location': 'Online',
      'imageUrl':
          'https://via.placeholder.com/600x400/FFC300/000000?text=Flutter',
    },
    {
      'title': 'Resep Makanan Sehat: Salad Buah Tropis',
      'description':
          'Resep salad buah tropis yang segar dan menyehatkan. Mudah dibuat dan cocok untuk camilan atau sarapan.',
      'price': 35000.0,
      'location': 'Yogyakarta',
      'imageUrl':
          'https://via.placeholder.com/600x400/00CED1/FFFFFF?text=Salad+Buah',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Text(
            'Postingan kamu',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
          height: 360.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _postData.length,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemBuilder: (context, index) {
              final data = _postData[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
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
      ],
    );
  }
}
