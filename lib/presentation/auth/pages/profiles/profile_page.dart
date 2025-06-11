import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  final String userEmail; // Tambahkan properti untuk email

  const ProfilePage({
    super.key,
    required this.userName,
    required this.userEmail, // Perbarui konstruktor
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Center(
            child: Container(
              width: 38.w,
              height: 38.h,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: Transform.translate(
                  offset: Offset(2.0, 0.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                    size: 20.w,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),
            SizedBox(height: 30.h),
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15.h),
            _buildSettingsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundImage: const AssetImage(
              'assets/images/onboarding_1.jpeg',
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: 15.h),
          Text(
            widget.userName, // Menggunakan userName dari widget
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            widget.userEmail, // Menggunakan userEmail dari widget
            style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
          ),
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B00),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'Premium',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Premium member since 2023',
            style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return Column(
      children: [
        _buildSettingsItem(
          icon: Icons.edit_note,
          text: 'Update details',
          onTap: () {
            debugPrint('Update details clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.work_outline,
          text: 'Manage account',
          onTap: () {
            debugPrint('Manage account clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.compare_arrows,
          text: 'Quick transfer',
          onTap: () {
            debugPrint('Quick transfer clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.notifications_none,
          text: 'Notification',
          onTap: () {
            debugPrint('Notification clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.security,
          text: 'Security',
          onTap: () {
            debugPrint('Security clicked');
          },
        ),
      ],
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87, size: 24.w),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black87, fontSize: 16.sp),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[500], size: 18.w),
          ],
        ),
      ),
    );
  }
}