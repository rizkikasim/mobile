import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const MenuItemCard({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.grey[100],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (backgroundColor ?? Colors.grey[100])!.withOpacity(
                    0.3,
                  ),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, size: 26.w, color: iconColor ?? Colors.black54),
          ),
          SizedBox(height: 6.h),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
