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
import 'package:propedia/presentation/auth/widgets/notify/custom_notification_card.dart';

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

  void _showSnackBar(String message, Color color, {String? title}) {
    Color? indicatorColor;
    Color? textColor;
    Color? backgroundColor;

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
      backgroundColor: backgroundColor,
      textColor: textColor,
      indicatorColor: indicatorColor,
    );
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
      _showSnackBar(
        'Semua field harus diisi!',
        Colors.red,
        title: 'Input Tidak Lengkap',
      );
      return;
    }

    if (password != confirmPassword) {
      _showSnackBar(
        'Password tidak cocok!',
        Colors.red,
        title: 'Password Tidak Cocok',
      );
      return;
    }

    if (!_agreeToTerms) {
      _showSnackBar(
        'Mohon setujui syarat dan ketentuan.',
        Colors.red,
        title: 'Persetujuan Diperlukan',
      );
      return;
    }

    if (_selectedUserType.isEmpty) {
      _showSnackBar(
        'Mohon pilih jenis akun (Penjual, Admin, atau Pembeli)!',
        Colors.red,
        title: 'Jenis Akun Diperlukan',
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
                        color: Color(0xFF8DBCC7),
                      ),
                    ),
              );
            },
            authenticated: (user) {
              Navigator.pop(context);
              _showSnackBar(
                'Anda sudah login!',
                Colors.blue,
                title: 'Sudah Login',
              );
            },
            otpSent: () {
              Navigator.pop(context);
              _showSnackBar(
                'Registrasi berhasil! OTP telah dikirim.',
                Colors.green,
                title: 'Registrasi Berhasil',
              );
              Future.delayed(const Duration(seconds: 1), () {
                if (context.mounted) {
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
                }
              });
            },
            error: (message) {
              Navigator.pop(context);
              _showSnackBar(
                'Error: $message',
                Colors.red,
                title: 'Registrasi Gagal',
              );
            },
            loggedOut: () {
              Navigator.pop(context);
              _showSnackBar(
                'Akun berhasil didaftarkan!',
                Colors.green,
                title: 'Pendaftaran Selesai',
              );
              Future.delayed(const Duration(seconds: 1), () {
                if (context.mounted) {
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
                }
              });
            },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),

              Text(
                'Yuk, Join Komunitas Properti! 🏡',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                'Daftar sekarang dan dapetin akses eksklusif buat nyari rumah, kos, tanah, apart, atau hotel impianmu. Gak cuma itu, kamu juga bisa jadi bestie properti bareng kita!',
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
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Color(0xFFA4CCD9),
                      width: 1.0,
                    ),
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
              SizedBox(height: 10.h),

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
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Color(0xFFA4CCD9),
                      width: 1.0,
                    ),
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
                      activeColor: Color(0xFF8DBCC7),
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
                    backgroundColor: Color(0xFF8DBCC7),
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
                        color: Color(0xFF8DBCC7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
