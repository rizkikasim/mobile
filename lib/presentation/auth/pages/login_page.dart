import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc
import 'package:propedia/models/request/auth/auth_request.dart'; // Import LoginRequest
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';
import 'package:propedia/presentation/auth/cubit/auth_state.dart';
import 'package:propedia/presentation/auth/pages/register_page.dart'; // Pastikan path ini benar
import 'package:propedia/presentation/home/pages/dashboard_page.dart'; // Pastikan path ini benar

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isLoading = false; // Untuk mengelola state loading pada tombol

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _onLoginPressed() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Email dan Password harus diisi!', Colors.red);
      return;
    }

    // Panggil cubit untuk login
    context.read<AuthCubit>().login(
          LoginRequest(
            identifier: email,
            password: password,
          ),
        );
  }

  void _onForgotPassword() {
    debugPrint('Forgot Password clicked!');
    // TODO: Implementasi navigasi ke halaman lupa password
    _showSnackBar('Fitur lupa password belum diimplementasikan.', Colors.blue);
  }

  void _onSignUp() {
    debugPrint('Sign Up clicked! Navigating to RegisterPage.');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {
              setState(() {
                _isLoading = false;
              });
            },
            loading: () {
              setState(() {
                _isLoading = true; // Aktifkan loading indicator
              });
            },
            authenticated: (user) {
              setState(() {
                _isLoading = false; // Nonaktifkan loading
              });
              _showSnackBar('Login berhasil! Selamat datang, ${user.username}!', Colors.green);
              // Navigasi ke DashboardPage setelah login berhasil
              // Gunakan pushReplacement agar pengguna tidak bisa kembali ke halaman login
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => DashboardPage(
                    userName: user.username ?? 'Pengguna', // Gunakan username dari API
                    userEmail: user.email ?? 'email@example.com', // **<--- ADD THIS LINE**
                  ),
                ),
              );
            },
            otpSent: () {
              setState(() {
                _isLoading = false;
              });
              // State ini seharusnya tidak dipancarkan pada LoginPage, kecuali jika ada alur spesifik
              _showSnackBar('OTP telah dikirim (dari login page).', Colors.blue);
            },
            error: (message) {
              setState(() {
                _isLoading = false; // Nonaktifkan loading
              });
              _showSnackBar('Login gagal: $message', Colors.red);
            },
            loggedOut: () {
              setState(() {
                _isLoading = false;
              });
              // State ini seharusnya tidak dipancarkan pada LoginPage, kecuali jika ada alur spesifik
            },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Image.asset(
                'assets/images/pizza_logo.png',
                height: 100.h,
                width: 100.w,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100.h,
                    width: 100.w,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.fastfood,
                      size: 50.w,
                      color: Colors.grey[500],
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              Text(
                'Welcome to Peppino Pizza',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Peppino Pizza handcrafted, and always delicious.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 16.w,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Enter Password', // Ubah hintText untuk login
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 16.w,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          activeColor: const Color(0xFFFF6B00),
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: _onForgotPassword,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFFFF6B00),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _onLoginPressed, // Nonaktifkan tombol saat loading
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white) // Tampilkan loading indicator
                      : Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton('assets/icons/google.png'),
                  SizedBox(width: 20.w),
                  _buildSocialButton('assets/icons/apple.png'),
                  SizedBox(width: 20.w),
                  _buildSocialButton('assets/icons/facebook.png'),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ', // Ubah teks sesuai konteks
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  ),
                  GestureDetector(
                    onTap: _onSignUp,
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFFFF6B00),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String imagePath) {
    return Container(
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
    );
  }
}