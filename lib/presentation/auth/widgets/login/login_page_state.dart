import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propedia/models/request/auth/auth_request.dart';
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';
import 'package:propedia/presentation/auth/cubit/auth_state.dart';
import 'package:propedia/presentation/auth/pages/login_page.dart';
import 'package:propedia/presentation/auth/pages/register_page.dart';
import 'package:propedia/presentation/auth/widgets/login/login_input_field.dart';
import 'package:propedia/presentation/auth/widgets/login/social_login_button.dart';
import 'package:propedia/presentation/home/pages/dashboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageState extends State<LoginPage> {
  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); // ✅ Cek apakah sudah login
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");
    if (token != null && token.isNotEmpty && context.mounted) {
      context.read<AuthCubit>().fetchMyProfile();
    }
  }

  @override
  void dispose() {
    _identifierController.dispose();
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
    final identifier = _identifierController.text;
    final password = _passwordController.text;

    if (identifier.isEmpty || password.isEmpty) {
      _showSnackBar('Email/Username/Phone dan Password harus diisi!', Colors.red);
      return;
    }

    context.read<AuthCubit>().login(
          LoginRequest(identifier: identifier, password: password),
        );
  }

  void _onForgotPassword() {
    _showSnackBar('Fitur lupa password belum diimplementasikan.', Colors.blue);
  }

  void _onSignUp() {
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
              setState(() => _isLoading = false);
            },
            loading: () {
              setState(() => _isLoading = true);
            },
            authenticated: (user) {
              setState(() => _isLoading = false);
              _showSnackBar('Login berhasil! Selamat datang, ${user.username}!', Colors.green);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => DashboardPage(
                    userName: user.username ?? 'Pengguna',
                    userEmail: user.email ?? 'email@example.com',
                    userRole: user.role ?? 'user',
                  ),
                ),
              );
            },
            otpSent: () {
              setState(() => _isLoading = false);
              _showSnackBar('OTP telah dikirim.', Colors.blue);
            },
            error: (message) {
              setState(() => _isLoading = false);
              _showSnackBar('Login gagal: $message', Colors.red);
            },
            loggedOut: () {
              setState(() => _isLoading = false);
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
                errorBuilder: (context, error, stackTrace) => Icon(Icons.fastfood, size: 50.w),
              ),
              SizedBox(height: 30.h),
              Text('Welcome to Peppino Pizza',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              Text('Peppino Pizza handcrafted, and always delicious.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
              SizedBox(height: 40.h),
              LoginInputField(
                label: 'Email/Username/Phone',
                hint: 'Enter your Email, Username, or Phone',
                controller: _identifierController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20.h),
              LoginInputField(
                label: 'Password',
                hint: 'Enter Password',
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) => setState(() => _rememberMe = value ?? false),
                        activeColor: const Color(0xFFFF6B00),
                      ),
                      Text('Remember me', style: TextStyle(fontSize: 13.sp)),
                    ],
                  ),
                  TextButton(
                    onPressed: _onForgotPassword,
                    child: Text('Forgot Password?',
                        style: TextStyle(fontSize: 13.sp, color: const Color(0xFFFF6B00))),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _onLoginPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Login', style: TextStyle(fontSize: 18.sp, color: Colors.white)),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text('Or continue with',
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(imagePath: 'assets/icons/google.png', onTap: () {}),
                  SizedBox(width: 20.w),
                  SocialLoginButton(imagePath: 'assets/icons/apple.png', onTap: () {}),
                  SizedBox(width: 20.w),
                  SocialLoginButton(imagePath: 'assets/icons/facebook.png', onTap: () {}),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? ', style: TextStyle(fontSize: 14.sp)),
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
}
