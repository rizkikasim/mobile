import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final List<String> items;
  // Anda bisa menambahkan onChanged callback dan value management jika ini Stateful widget
  // final ValueChanged<String?>? onChanged;
  // final String? selectedValue;

  // Warna utama aplikasi
  static const Color darkText = Color(0xFF2C3E50);
  static const Color lightGreyText = Color(0xFF7F8C8D);

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.items,
    // this.onChanged,
    // this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: darkText, // Menggunakan definisi lokal
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.grey.shade300, width: 1.w),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: items.first, // Anda perlu mengelola state value ini di Stateful Widget
              icon: Icon(Icons.keyboard_arrow_down, color: lightGreyText, size: 24.w), // Menggunakan definisi lokal
              style: TextStyle(fontSize: 16.sp, color: darkText), // Menggunakan definisi lokal
              onChanged: (String? newValue) {
                // if (onChanged != null) {
                //   onChanged!(newValue);
                // }
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}