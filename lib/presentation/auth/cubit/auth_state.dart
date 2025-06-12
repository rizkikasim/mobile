import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propedia/models/dtos/auth/auth_dto.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserDto user) = _Authenticated;
  const factory AuthState.otpSent() = _OtpSent;
  const factory AuthState.error(String message) = _Error;
  const factory AuthState.loggedOut() = _LoggedOut;
}
