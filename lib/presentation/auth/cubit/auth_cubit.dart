import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:propedia/models/dtos/auth/auth_dto.dart';
import 'package:propedia/models/request/auth/auth_request.dart';
import 'package:propedia/services/auth/auth_api_services.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthApiService _authApi;

  AuthCubit(this._authApi) : super(const AuthState.initial());

  Future<void> login(LoginRequest request) async {
    emit(const AuthState.loading());
    try {
      final response = await _authApi.adminLogin(request.toJson());
      final dto = LoginResponseDto.fromJson(response.data);

      if (dto.data != null) {
        final d = dto.data!;
        final user = UserDto(
          id: d.id.toString(),
          username: d.username,
          email: d.email,
          phone: d.phone,
          role: d.role,
          address: d.address,
          isVerified: true, // hardcode karena backend belum kirim
          isActive: true,   // sama
          createdAt: d.createdAt,
          updatedAt: d.updatedAt,
        );

        emit(AuthState.authenticated(user));
      } else {
        emit(AuthState.error(dto.message ?? "Login gagal: data kosong"));
      }
    } catch (e) {
      emit(AuthState.error("Login gagal: ${e.toString()}"));
    }
  }

  Future<void> register(RegisterRequest request) async {
    emit(const AuthState.loading());
    try {
      await _authApi.adminRegister(request.toJson());
      emit(const AuthState.loggedOut());
    } catch (e) {
      emit(AuthState.error("Register gagal: ${e.toString()}"));
    }
  }

  Future<void> fetchMyProfile() async {
    emit(const AuthState.loading());
    try {
      final response = await _authApi.adminGetMyProfile();
      final user = UserDto.fromJson(response.data);
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error("Gagal ambil profil: ${e.toString()}"));
    }
  }

  Future<void> logout(String id) async {
    emit(const AuthState.loading());
    try {
      await _authApi.adminLogout(id);
      emit(const AuthState.loggedOut());
    } catch (e) {
      emit(AuthState.error("Logout gagal: ${e.toString()}"));
    }
  }

  Future<void> sendOtp(SendOtpRequest request) async {
    emit(const AuthState.loading());
    try {
      await _authApi.sendOtp(request.toJson());
      emit(const AuthState.otpSent());
    } catch (e) {
      emit(AuthState.error("Gagal kirim OTP: ${e.toString()}"));
    }
  }

  Future<void> verifyOtp(VerifyOtpRequest request) async {
    emit(const AuthState.loading());
    try {
      await _authApi.verifyOtp(request.toJson());
      emit(const AuthState.loggedOut());
    } catch (e) {
      emit(AuthState.error("OTP verifikasi gagal: ${e.toString()}"));
    }
  }
}
