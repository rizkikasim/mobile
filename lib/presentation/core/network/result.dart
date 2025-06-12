import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart'; // Ini akan digenerate oleh Freezed

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = _Success;
  const factory Result.failure({
    required String message,
    int? statusCode,
    dynamic error, // Bisa menyimpan objek DioError atau exception lainnya
  }) = _Failure;
}