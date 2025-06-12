import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FlashSaleCard extends StatelessWidget {
  final String productImageUrl;
  final String productName;
  final double originalPrice;
  final double discountedPrice;
  final int remainingStock;
  final double progress;

  const FlashSaleCard({
    super.key,
    required this.productImageUrl,
    required this.productName,
    required this.originalPrice,
    required this.discountedPrice,
    required this.remainingStock,
    required this.progress,
  });

  String _formatPrice(double price) {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
            child: Image.asset(
              productImageUrl,
              height: 90.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 90.h,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 35.w,
                      color: Colors.grey[400],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),

                Text(
                  _formatPrice(originalPrice),
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey[600],
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(height: 2.h),

                Text(
                  _formatPrice(discountedPrice),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                ),
                SizedBox(height: 8.h),

                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          '$remainingStock left',
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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
