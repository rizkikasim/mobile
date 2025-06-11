import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propedia/models/request/auth/auth_request.dart';
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';
import 'package:propedia/presentation/auth/cubit/auth_state.dart';

class OtpPage extends StatefulWidget {
  // Pastikan Anda meneruskan 'phone' dari halaman sebelumnya (misalnya RegisterPage)
  final String phone;

  const OtpPage({super.key, required this.phone});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
  bool _isVerifying = false; // Untuk mengelola loading state tombol "Continue"
  bool _isResending = false; // Untuk mengelola loading state link "Request new code"

  @override
  void initState() {
    super.initState();
    _startCountdown();
    // Menambahkan listener untuk setiap OTP input field
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
    _timer?.cancel(); // Batalkan timer sebelumnya jika ada
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCountdown == 0) {
        setState(() {
          timer.cancel();
          _isResending = false; // Reset status isResending ketika countdown selesai
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
      // Pindah fokus ke input berikutnya jika ada
      if (index < _otpControllers.length - 1) {
        _otpFocusNodes[index + 1].requestFocus();
      } else {
        // Jika sudah input terakhir, sembunyikan keyboard
        _otpFocusNodes[index].unfocus();
      }
    } else {
      // Pindah fokus ke input sebelumnya jika input saat ini kosong (saat menghapus karakter)
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
      _showSnackBar('Nomor telepon tidak ditemukan untuk verifikasi.', Colors.red);
      return;
    }

    // Panggil cubit untuk verifikasi OTP
    context.read<AuthCubit>().verifyOtp(
          VerifyOtpRequest(
            phone: widget.phone, // Menggunakan 'phone'
            otp: enteredOtp,     // Menggunakan 'otp'
          ),
        );
  }

  void _onResendOtpPressed() {
    // Hanya bisa mengirim ulang jika countdown sudah 0 dan tidak sedang dalam proses resending
    if (_resendCountdown == 0 && !_isResending) {
      if (widget.phone.isEmpty) {
        _showSnackBar('Nomor telepon tidak ditemukan untuk kirim ulang OTP.', Colors.red);
        return;
      }
      setState(() {
        _isResending = true; // Set status resending menjadi true
        _resendCountdown = 79; // Reset countdown
      });
      _startCountdown(); // Mulai hitung mundur lagi

      // Panggil cubit untuk mengirim ulang OTP
      context.read<AuthCubit>().sendOtp(
            SendOtpRequest(phone: widget.phone), // Menggunakan 'phone'
          );
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
          // Reset semua status loading terlebih dahulu
          setState(() {
            _isVerifying = false;
            _isResending = false;
          });

          state.when(
            initial: () {},
            loading: () {
              // Ketika state adalah loading, kita bisa tentukan mana yang loading
              // Berhati-hatilah agar tidak menimpa status jika ada dua proses loading potensial
              // Untuk kasus ini, kita asumsikan salah satu operasi (verify/resend) sedang berjalan.
              // Logika ini mungkin perlu diperbaiki jika Anda punya dua cubit yang berbeda
              // atau cara yang lebih spesifik untuk mengidentifikasi proses loading.
              // Untuk saat ini, kita akan aktifkan kedua flag loading.
              setState(() {
                _isVerifying = true;
                _isResending = true;
              });
            },
            authenticated: (user) {
              _showSnackBar('Verifikasi OTP berhasil! Anda telah login.', Colors.green);
              // Contoh: Navigasi ke halaman utama setelah login
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(builder: (context) => HomePage()),
              //   (Route<dynamic> route) => false,
              // );
            },
            otpSent: () {
              // State ini dipancarkan setelah _AuthCubit.sendOtp() berhasil
              _showSnackBar('Kode OTP berhasil dikirim ulang!', Colors.green);
              // Countdown sudah diatur ulang di _onResendOtpPressed(),
              // dan _startCountdown() akan memulai timer baru.
            },
            error: (message) {
              _showSnackBar('Error: $message', Colors.red);
            },
            loggedOut: () {
              // State ini dipancarkan setelah _AuthCubit.verifyOtp() berhasil
              _showSnackBar('Verifikasi OTP berhasil! Akun Anda terverifikasi.', Colors.green);
              // Contoh: Navigasi kembali ke halaman Login atau ke halaman lain setelah verifikasi
              Navigator.of(context).pop();
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
                'We\'ve sent 6 code to ${widget.phone}', // Tampilkan nomor telepon yang sebenarnya
                style: TextStyle(color: Colors.grey[700], fontSize: 14.sp),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return _buildOtpInputField(index);
                }),
              ),
              SizedBox(height: 30.h),
              Text(
                'Didn\'t get a code?',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                // Nonaktifkan link jika sedang resending atau countdown belum selesai
                onTap: _isResending || _resendCountdown != 0
                    ? null
                    : _onResendOtpPressed,
                child: Text(
                  _resendCountdown == 0
                      ? (_isResending ? 'Mengirim...' : 'Request new code')
                      : 'Request new code in ${_formatCountdown(_resendCountdown)}',
                  style: TextStyle(
                    color: _resendCountdown == 0 && !_isResending ? Colors.blue : Colors.grey,
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
                  // Nonaktifkan tombol jika sedang memverifikasi
                  onPressed: _isVerifying ? null : _onVerifyOtpPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: _isVerifying
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

  Widget _buildOtpInputField(int index) {
    return Container(
      width: 45.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[400]!, width: 1.w),
      ),
      child: Center(
        child: TextField(
          controller: _otpControllers[index],
          focusNode: _otpFocusNodes[index],
          maxLength: 1,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}