import 'package:freezed_annotation/freezed_annotation.dart';

part 'properties_dto.freezed.dart';
part 'properties_dto.g.dart';

@freezed
class PropertyDto with _$PropertyDto {
  const factory PropertyDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'property_id') required String propertyId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'nama_rumah') required String title,
    @JsonKey(name: 'harga') required int price,
    @JsonKey(name: 'tipe_rumah') required String type,
    @JsonKey(name: 'deskripsi') required String description,
    @JsonKey(name: 'lokasi') required String location,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_available') @Default(false) bool isAvailable,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
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
    @JsonKey(name: 'data') required PropertyDto data,
  }) = _CreatePropertyResponseDto;

  factory CreatePropertyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyResponseDtoFromJson(json);
}
