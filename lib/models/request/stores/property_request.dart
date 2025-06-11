import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_request.freezed.dart';
part 'property_request.g.dart';

@freezed
class CreatePropertyRequest with _$CreatePropertyRequest {
  const factory CreatePropertyRequest({
    @JsonKey(name: 'nama_rumah') required String title,
    @JsonKey(name: 'deskripsi') required String description,
    @JsonKey(name: 'tipe_rumah') required String type,
    @JsonKey(name: 'harga') required int price,
    @JsonKey(name: 'lokasi') required String location,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _CreatePropertyRequest;

  factory CreatePropertyRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyRequestFromJson(json);
}

@freezed
class UpdatePropertyRequest with _$UpdatePropertyRequest {
  const factory UpdatePropertyRequest({
    @JsonKey(name: 'nama_rumah') String? title,
    @JsonKey(name: 'deskripsi') String? description,
    @JsonKey(name: 'tipe_rumah') String? type,
    @JsonKey(name: 'harga') int? price,
    @JsonKey(name: 'lokasi') String? location,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_available') bool? isAvailable,
  }) = _UpdatePropertyRequest;

  factory UpdatePropertyRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePropertyRequestFromJson(json);
}
