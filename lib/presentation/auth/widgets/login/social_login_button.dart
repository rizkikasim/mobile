// lib/presentation/auth/pages/login/widgets/social_login_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 30.w,
            height: 30.h,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 30.w, color: Colors.red);
            },
          ),
        ),
      ),
    );
  }
}