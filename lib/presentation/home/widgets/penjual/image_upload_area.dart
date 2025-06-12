import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUploadArea extends StatelessWidget {
  const ImageUploadArea({super.key});

  static const Color primaryOrange = Color(0xFFFF6B00);
  static const Color darkText = Color(0xFF2C3E50);
  static const Color lightGreyText = Color(0xFF7F8C8D);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_upload_outlined, size: 60.w, color: primaryOrange),
          SizedBox(height: 12.h),
          Text(
            'Ketuk untuk Tambahkan Foto Produk',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: darkText,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Maksimal 5 foto (ukuran maks. 2MB/foto)',
            style: TextStyle(fontSize: 13.sp, color: lightGreyText),
          ),
        ],
      ),
    );
  }
}
