import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_request.freezed.dart';
part 'property_request.g.dart';

@freezed
class CreatePropertyRequest with _$CreatePropertyRequest {
  const factory CreatePropertyRequest({
    required String namaRumah,
    required String deskripsi,
    required String tipeRumah,
    required int harga,
    required String lokasi,
    String? imageUrl,
  }) = _CreatePropertyRequest;

  factory CreatePropertyRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyRequestFromJson(json);
}

@freezed
class UpdatePropertyRequest with _$UpdatePropertyRequest {
  const factory UpdatePropertyRequest({
    String? namaRumah,
    String? deskripsi,
    String? tipeRumah,
    int? harga,
    String? lokasi,
    String? imageUrl,
    bool? isAvailable,
  }) = _UpdatePropertyRequest;

  factory UpdatePropertyRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePropertyRequestFromJson(json);
}
