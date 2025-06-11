// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePropertyRequestImpl _$$CreatePropertyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePropertyRequestImpl(
      title: json['nama_rumah'] as String,
      description: json['deskripsi'] as String,
      type: json['tipe_rumah'] as String,
      price: (json['harga'] as num).toInt(),
      location: json['lokasi'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$CreatePropertyRequestImplToJson(
        _$CreatePropertyRequestImpl instance) =>
    <String, dynamic>{
      'nama_rumah': instance.title,
      'deskripsi': instance.description,
      'tipe_rumah': instance.type,
      'harga': instance.price,
      'lokasi': instance.location,
      'image_url': instance.imageUrl,
    };

_$UpdatePropertyRequestImpl _$$UpdatePropertyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePropertyRequestImpl(
      title: json['nama_rumah'] as String?,
      description: json['deskripsi'] as String?,
      type: json['tipe_rumah'] as String?,
      price: (json['harga'] as num?)?.toInt(),
      location: json['lokasi'] as String?,
      imageUrl: json['image_url'] as String?,
      isAvailable: json['is_available'] as bool?,
    );

Map<String, dynamic> _$$UpdatePropertyRequestImplToJson(
        _$UpdatePropertyRequestImpl instance) =>
    <String, dynamic>{
      'nama_rumah': instance.title,
      'deskripsi': instance.description,
      'tipe_rumah': instance.type,
      'harga': instance.price,
      'lokasi': instance.location,
      'image_url': instance.imageUrl,
      'is_available': instance.isAvailable,
    };
