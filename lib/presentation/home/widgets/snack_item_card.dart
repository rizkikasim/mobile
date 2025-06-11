// lib/presentation/home/widgets/snack_item_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackItemCard extends StatelessWidget {
  final String productImageUrl;
  final String title;
  final String price;
  final String location;
  final String? discountPercentage;

  const SnackItemCard({
    super.key,
    required this.productImageUrl,
    required this.title,
    required this.price,
    required this.location,
    this.discountPercentage,
  });

  String _formatPrice(String priceString) {
    try {
      final cleanedPrice = priceString.replaceAll(RegExp(r'[^\d-]'), '');
      if (cleanedPrice.isEmpty) {
        return priceString;
      }

      final num? priceNum =
          int.tryParse(cleanedPrice) ?? double.tryParse(cleanedPrice);

      if (priceNum == null) {
        return priceString;
      }

      final formatter = RegExp(r'\B(?=(\d{3})+(?!\d))');
      String formatted = priceNum.toStringAsFixed(0).replaceAll(formatter, '.');
      return 'Rp $formatted';
    } catch (e) {
      return priceString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 230.h,
      // HAPUS MARGIN DARI SINI
      // margin: EdgeInsets.only(right: 15.w), // <--- HAPUS BARIS INI
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15.r)),
                child: Image.asset(
                  productImageUrl,
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120.h,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image,
                        size: 50.w,
                        color: Colors.grey[500],
                      ),
                    );
                  },
                ),
              ),
              if (discountPercentage != null && discountPercentage!.isNotEmpty)
                Positioned(
                  top: 10.h,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      '$discountPercentage Diskon',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 7.h),
                Text(
                  _formatPrice(price),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14.w,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}