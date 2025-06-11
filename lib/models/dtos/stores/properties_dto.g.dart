// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyDtoImpl _$$PropertyDtoImplFromJson(Map<String, dynamic> json) =>
    _$PropertyDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      propertyId: json['propertyId'] as String?,
      userId: (json['userId'] as num).toInt(),
      namaRumah: json['namaRumah'] as String,
      harga: (json['harga'] as num).toInt(),
      tipeRumah: json['tipeRumah'] as String,
      deskripsi: json['deskripsi'] as String,
      lokasi: json['lokasi'] as String,
      imageUrl: json['imageUrl'] as String?,
      isAvailable: json['isAvailable'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PropertyDtoImplToJson(_$PropertyDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'propertyId': instance.propertyId,
      'userId': instance.userId,
      'namaRumah': instance.namaRumah,
      'harga': instance.harga,
      'tipeRumah': instance.tipeRumah,
      'deskripsi': instance.deskripsi,
      'lokasi': instance.lokasi,
      'imageUrl': instance.imageUrl,
      'isAvailable': instance.isAvailable,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$PropertyTypeDtoImpl _$$PropertyTypeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertyTypeDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$PropertyTypeDtoImplToJson(
        _$PropertyTypeDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$CreatePropertyResponseDtoImpl _$$CreatePropertyResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePropertyResponseDtoImpl(
      message: json['message'] as String?,
      data: PropertyDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreatePropertyResponseDtoImplToJson(
        _$CreatePropertyResponseDtoImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
