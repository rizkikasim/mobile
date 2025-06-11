// lib/presentation/home/widgets/snack_item_shimmer.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer

class SnackItemShimmer extends StatelessWidget {
  const SnackItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Warna dasar shimmer
      highlightColor: Colors.grey[100]!, // Warna highlight shimmer
      child: Container(
        width: 120.w,
        margin: EdgeInsets.only(right: 15.w),
        decoration: BoxDecoration(
          color: Colors.white, // Background putih untuk placeholder
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder untuk gambar
            Container(
              height: 100.h,
              width: double.infinity,
              color: Colors.white, // Warna "gambar" dalam shimmer
              margin: EdgeInsets.zero, // Pastikan tidak ada margin yang mengganggu
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Placeholder untuk judul
                  Container(
                    width: 80.w, // Lebar placeholder teks
                    height: 13.sp,
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 5.h),
                  ),
                  // Placeholder untuk subtitle
                  Container(
                    width: 60.w, // Lebar placeholder teks
                    height: 11.sp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Anda juga bisa membuat shimmer untuk bagian lain jika diperlukan,
// contohnya untuk MenuSection atau ActionButton.
class MenuSectionShimmer extends StatelessWidget {
  const MenuSectionShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.8, // Sesuaikan dengan rasio MenuItemCard Anda
        ),
        itemCount: 8, // Tampilkan beberapa item shimmer
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 60.w,
                  height: 12.sp,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}