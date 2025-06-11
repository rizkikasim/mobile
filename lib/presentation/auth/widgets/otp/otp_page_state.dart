import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/models/request/auth/auth_request.dart';
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';
import 'package:propedia/presentation/auth/cubit/auth_state.dart';
import 'package:propedia/presentation/auth/pages/otp/otp_page.dart';
import 'package:propedia/presentation/auth/widgets/otp/otp_input_field.dart';
import 'package:propedia/presentation/home/pages/dashboard_page.dart';

class OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  int _resendCountdown = 79;
  Timer? _timer;
  bool _isVerifying = false;
  bool _isResending = false;
  bool _otpVerified = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpControllers[i].addListener(() {
        _handleOtpInput(i);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCountdown == 0) {
        setState(() {
          timer.cancel();
          _isResending = false;
        });
      } else {
        setState(() {
          _resendCountdown--;
        });
      }
    });
  }

  void _handleOtpInput(int index) {
    if (_otpControllers[index].text.isNotEmpty) {
      if (index < _otpControllers.length - 1) {
        _otpFocusNodes[index + 1].requestFocus();
      } else {
        _otpFocusNodes[index].unfocus();
      }
    } else {
      if (index > 0) {
        _otpFocusNodes[index - 1].requestFocus();
      }
    }
  }

  String _formatCountdown(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(1, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
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

  void _onVerifyOtpPressed() {
    String enteredOtp = _otpControllers.map((e) => e.text).join();
    if (enteredOtp.length != 6) {
      _showSnackBar('Mohon masukkan kode OTP lengkap.', Colors.red);
      return;
    }
    if (widget.phone.isEmpty) {
      _showSnackBar(
        'Nomor telepon tidak ditemukan untuk verifikasi.',
        Colors.red,
      );
      return;
    }

    setState(() {
      _isVerifying = true;
    });
    context.read<AuthCubit>().verifyOtp(
      VerifyOtpRequest(phone: widget.phone, otp: enteredOtp),
    );
  }

  void _onResendOtpPressed() {
    if (_resendCountdown == 0 && !_isResending) {
      if (widget.phone.isEmpty) {
        _showSnackBar(
          'Nomor telepon tidak ditemukan untuk kirim ulang OTP.',
          Colors.red,
        );
        return;
      }
      setState(() {
        _isResending = true;
        _resendCountdown = 79;
      });
      _startCountdown();

      context.read<AuthCubit>().sendOtp(SendOtpRequest(phone: widget.phone));
      _showSnackBar('Mengirim ulang kode OTP...', Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Verify account with OTP',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          setState(() {
            _isVerifying = false;
            _isResending = false;
          });

          state.when(
            initial: () {},
            loading: () {},
            authenticated: (user) {
              _showSnackBar(
                'Verifikasi OTP berhasil! Anda telah login.',
                Colors.green,
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder:
                      (context) => DashboardPage(
                        userName: user.username,
                        userEmail: user.email,
                        userRole: user.role,
                      ),
                ),
                (Route<dynamic> route) => false,
              );
            },
            otpSent: () {
              _showSnackBar('Kode OTP berhasil dikirim ulang!', Colors.green);
            },
            error: (message) {
              _showSnackBar('Error: $message', Colors.red);
            },
            loggedOut: () {
              _showSnackBar(
                'Verifikasi OTP berhasil. Masuk ke dashboard...',
                Colors.green,
              );

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder:
                      (context) => DashboardPage(
                        userName: widget.userName,
                        userEmail: widget.userEmail,
                        userRole: widget.userRole,
                      ),
                ),
                (Route<dynamic> route) => false,
              );
            },
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'We\'ve sent 6 code to ${widget.phone}',
                style: TextStyle(color: Colors.grey[700], fontSize: 14.sp),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return OtpInputField(
                    controller: _otpControllers[index],
                    focusNode: _otpFocusNodes[index],
                  );
                }),
              ),
              SizedBox(height: 30.h),
              Text(
                'Didn\'t get a code?',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap:
                    _isResending || _resendCountdown != 0
                        ? null
                        : _onResendOtpPressed,
                child: Text(
                  _resendCountdown == 0
                      ? (_isResending ? 'Mengirim...' : 'Request new code')
                      : 'Request new code in ${_formatCountdown(_resendCountdown)}',
                  style: TextStyle(
                    color:
                        _resendCountdown == 0 && !_isResending
                            ? Colors.blue
                            : Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed:
                      _isVerifying
                          ? null
                          : _otpVerified
                          ? () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder:
                                    (context) => DashboardPage(
                                      userName: widget.userName,
                                      userEmail: widget.userEmail,
                                      userRole: widget.userRole,
                                    ),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          }
                          : _onVerifyOtpPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child:
                      _isVerifying
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                ),
              ),

              SizedBox(height: 20.h),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                    children: [
                      const TextSpan(
                        text: 'By entering your number you agree to our ',
                      ),
                      TextSpan(
                        text: 'Terms & Privacy Policy',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
