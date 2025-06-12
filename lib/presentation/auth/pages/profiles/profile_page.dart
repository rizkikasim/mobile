import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';
import 'package:propedia/presentation/auth/cubit/auth_state.dart';
import 'package:propedia/presentation/auth/pages/login_page.dart';
// Impor CustomNotificationCard dan showCustomSnackBar
import 'package:propedia/presentation/auth/widgets/notify/custom_notification_card.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userRole;

  const ProfilePage({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userRole,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Fungsi _showSnackBar yang sama seperti di LoginPageState
  void _showSnackBar(String message, Color color, {String? title}) {
    Color? indicatorColor;
    Color? textColor;
    Color? backgroundColor;

    // Menentukan warna berdasarkan 'color' yang diberikan
    if (color == Colors.red) {
      indicatorColor = Colors.red;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      title = title ?? 'Error';
    } else if (color == Colors.green) {
      indicatorColor = Colors.green;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      title = title ?? 'Sukses';
    } else if (color == Colors.blue) {
      indicatorColor = Colors.blue;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      title = title ?? 'Informasi';
    } else {
      indicatorColor = Theme.of(context).primaryColor;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      title = title ?? 'Notifikasi';
    }

    showCustomSnackBar(
      context,
      message: message,
      title: title,
      // icon: icon, // Tidak ada ikon sesuai permintaan sebelumnya
      backgroundColor: backgroundColor,
      textColor: textColor,
      indicatorColor: indicatorColor,
      // customBoxShadow, titleStyle, messageStyle bisa ditambahkan jika perlu
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loggedOut: () {
            // Tampilkan CustomNotificationCard setelah logout berhasil
            _showSnackBar(
              'Anda telah berhasil keluar dari akun.',
              Colors.green,
              title: 'Berhasil Logout!',
            );
            // Kemudian navigasi setelah notifikasi muncul (beri sedikit jeda jika diperlukan)
            Future.delayed(const Duration(seconds: 1), () { // Memberi waktu notifikasi muncul
              if (context.mounted) { // Pastikan widget masih mounted
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              }
            });
          },
          error: (message) {
            // Mengganti SnackBar default dengan CustomNotificationCard
            _showSnackBar(
              'Logout gagal: $message',
              Colors.red,
              title: 'Gagal Logout',
            );
          },
        );
      },
      child: Scaffold(
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
            widget.userName,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            widget.userEmail,
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
              widget.userRole.toUpperCase(),
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
          text: 'Bahasa',
          onTap: () {
            debugPrint('Update details clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.work_outline,
          text: 'Pengaturan Akun',
          onTap: () {
            debugPrint('Manage account clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.compare_arrows,
          text: 'Keluar',
          onTap: () {
            // Memanggil showDialog kustom yang disederhanakan
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 300),
              transitionBuilder: (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutBack,
                  ),
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.all(24.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Apakah kamu yakin ingin keluar dari akun ini?",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[200],
                                  foregroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                ),
                                child: Text(
                                  "Batal",
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  context.read<AuthCubit>().logout();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF6B00),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                ),
                                child: Text(
                                  "Keluar",
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
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