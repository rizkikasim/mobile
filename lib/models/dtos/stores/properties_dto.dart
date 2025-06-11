import 'package:freezed_annotation/freezed_annotation.dart';

part 'properties_dto.freezed.dart';
part 'properties_dto.g.dart';

@freezed
class PropertyDto with _$PropertyDto {
  const factory PropertyDto({
    int? id,
    String? propertyId,
    required int userId,
    required String namaRumah,
    required int harga,
    required String tipeRumah,
    required String deskripsi,
    required String lokasi,
    String? imageUrl,
    @Default(false) bool isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PropertyDto;

  factory PropertyDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyDtoFromJson(json);
}

@freezed
class PropertyTypeDto with _$PropertyTypeDto {
  const factory PropertyTypeDto({
    required String id,
    required String name,
  }) = _PropertyTypeDto;

  factory PropertyTypeDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeDtoFromJson(json);
}

@freezed
class CreatePropertyResponseDto with _$CreatePropertyResponseDto {
  const factory CreatePropertyResponseDto({
    String? message,
    required PropertyDto data,
  }) = _CreatePropertyResponseDto;

  factory CreatePropertyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyResponseDtoFromJson(json);
}
