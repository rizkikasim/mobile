// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyDtoImpl _$$PropertyDtoImplFromJson(Map<String, dynamic> json) =>
    _$PropertyDtoImpl(
      id: (json['id'] as num).toInt(),
      propertyId: json['property_id'] as String,
      userId: (json['user_id'] as num).toInt(),
      title: json['nama_rumah'] as String,
      price: (json['harga'] as num).toInt(),
      type: json['tipe_rumah'] as String,
      description: json['deskripsi'] as String,
      location: json['lokasi'] as String,
      imageUrl: json['image_url'] as String?,
      isAvailable: json['is_available'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PropertyDtoImplToJson(_$PropertyDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'user_id': instance.userId,
      'nama_rumah': instance.title,
      'harga': instance.price,
      'tipe_rumah': instance.type,
      'deskripsi': instance.description,
      'lokasi': instance.location,
      'image_url': instance.imageUrl,
      'is_available': instance.isAvailable,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
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
