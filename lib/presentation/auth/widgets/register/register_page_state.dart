import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';
import 'package:propedia/presentation/auth/cubit/auth_state.dart';
import 'package:propedia/presentation/auth/pages/otp/otp_page.dart';
import 'package:propedia/models/request/auth/auth_request.dart';
import 'package:propedia/presentation/auth/pages/register_page.dart';
import 'package:propedia/presentation/auth/widgets/register/register_input_field.dart';
import 'package:propedia/presentation/auth/widgets/register/user_type_selector.dart';
import 'package:propedia/presentation/auth/widgets/utils/register_utils.dart';

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _agreeToTerms = false;
  Set<UserType> _selectedUserType = {};

  String _passwordStrength = '';
  Color _passwordStrengthColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkPasswordStrength);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength() {
    final password = _passwordController.text;
    setState(() {
      final strengthData = RegisterUtils.checkPasswordStrength(password);
      _passwordStrength = strengthData['strength'] as String;
      _passwordStrengthColor = strengthData['color'] as Color;
    });
  }

  void _onRegisterPressed() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (username.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showSnackBar('Semua field harus diisi!', Colors.red);
      return;
    }

    if (password != confirmPassword) {
      _showSnackBar('Password tidak cocok!', Colors.red);
      return;
    }

    if (!_agreeToTerms) {
      _showSnackBar('Mohon setujui syarat dan ketentuan.', Colors.red);
      return;
    }

    if (_selectedUserType.isEmpty) {
      _showSnackBar(
        'Mohon pilih jenis akun (Penjual, Admin, atau Pembeli)!',
        Colors.red,
      );
      return;
    }

    final UserType selectedUserTypeEnum = _selectedUserType.first;

    if (kDebugMode) {
      print(
        'Registering as: ${selectedUserTypeEnum.toString().split('.').last}',
      );
    }

    context.read<AuthCubit>().register(
      RegisterRequest(
        username: username,
        email: email,
        phone: phone,
        password: password,
      ),
      userType: selectedUserTypeEnum,
    );
  }

  void _onLoginNow() {
    Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder:
                    (ctx) => Center(
                      child: CircularProgressIndicator(
                        color: const Color(0xFFFF6B00),
                      ),
                    ),
              );
            },
            authenticated: (user) {
              Navigator.pop(context);
              _showSnackBar('Anda sudah login!', Colors.blue);
            },
            otpSent: () {
              Navigator.pop(context);
              _showSnackBar(
                'Registrasi berhasil! OTP telah dikirim.',
                Colors.green,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => OtpPage(
                        phone: _phoneController.text,
                        userName: _usernameController.text,
                        userEmail: _emailController.text,
                        userRole: _selectedUserType.first.name,
                      ),
                ),
              );
            },
            error: (message) {
              Navigator.pop(context);
              _showSnackBar('Error: $message', Colors.red);
            },
            loggedOut: () {
              Navigator.pop(context);
              _showSnackBar('Akun berhasil didaftarkan!', Colors.green);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => OtpPage(
                        phone: _phoneController.text,
                        userName: _usernameController.text,
                        userEmail: _emailController.text,
                        userRole: _selectedUserType.first.name,
                      ),
                ),
              );
            },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20.w,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),

              Image.asset(
                'assets/images/pizza_logo.png',
                height: 80.h,
                width: 80.w,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 80.h,
                    width: 80.w,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.fastfood,
                      size: 40.w,
                      color: Colors.grey[500],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              Text(
                'Create New Account',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Please fill out the form below to create your account.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
              SizedBox(height: 30.h),

              RegisterInputField(
                label: 'Username',
                hint: 'Enter your Username',
                controller: _usernameController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20.h),

              RegisterInputField(
                label: 'Email',
                hint: 'Enter your Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),

              RegisterInputField(
                label: 'Phone',
                hint: 'Enter your Phone Number',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20.h),

              UserTypeSelector(
                selectedUserType: _selectedUserType,
                onSelectionChanged: (newSelection) {
                  setState(() {
                    _selectedUserType = newSelection;
                  });
                },
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
                  hintText: 'Create Password',
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
              SizedBox(height: 5.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _passwordStrength.isEmpty
                      ? ''
                      : 'Strength: $_passwordStrength',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: _passwordStrengthColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Retype Password',
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
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              Row(
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Checkbox(
                      value: _agreeToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
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
                  Expanded(
                    child: Text(
                      'I agree to the terms and conditions and privacy policy.',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey[700],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _onRegisterPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading:
                            () =>
                                CircularProgressIndicator(color: Colors.white),
                        orElse:
                            () => Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  ),
                  GestureDetector(
                    onTap: _onLoginNow,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFFFF6B00),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
