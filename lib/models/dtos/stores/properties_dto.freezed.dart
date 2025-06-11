// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'properties_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertyDto _$PropertyDtoFromJson(Map<String, dynamic> json) {
  return _PropertyDto.fromJson(json);
}

/// @nodoc
mixin _$PropertyDto {
  int? get id => throw _privateConstructorUsedError;
  String? get propertyId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get namaRumah => throw _privateConstructorUsedError;
  int get harga => throw _privateConstructorUsedError;
  String get tipeRumah => throw _privateConstructorUsedError;
  String get deskripsi => throw _privateConstructorUsedError;
  String get lokasi => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PropertyDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyDtoCopyWith<PropertyDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyDtoCopyWith<$Res> {
  factory $PropertyDtoCopyWith(
          PropertyDto value, $Res Function(PropertyDto) then) =
      _$PropertyDtoCopyWithImpl<$Res, PropertyDto>;
  @useResult
  $Res call(
      {int? id,
      String? propertyId,
      int userId,
      String namaRumah,
      int harga,
      String tipeRumah,
      String deskripsi,
      String lokasi,
      String? imageUrl,
      bool isAvailable,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$PropertyDtoCopyWithImpl<$Res, $Val extends PropertyDto>
    implements $PropertyDtoCopyWith<$Res> {
  _$PropertyDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? propertyId = freezed,
    Object? userId = null,
    Object? namaRumah = null,
    Object? harga = null,
    Object? tipeRumah = null,
    Object? deskripsi = null,
    Object? lokasi = null,
    Object? imageUrl = freezed,
    Object? isAvailable = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      namaRumah: null == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      tipeRumah: null == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      lokasi: null == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyDtoImplCopyWith<$Res>
    implements $PropertyDtoCopyWith<$Res> {
  factory _$$PropertyDtoImplCopyWith(
          _$PropertyDtoImpl value, $Res Function(_$PropertyDtoImpl) then) =
      __$$PropertyDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? propertyId,
      int userId,
      String namaRumah,
      int harga,
      String tipeRumah,
      String deskripsi,
      String lokasi,
      String? imageUrl,
      bool isAvailable,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PropertyDtoImplCopyWithImpl<$Res>
    extends _$PropertyDtoCopyWithImpl<$Res, _$PropertyDtoImpl>
    implements _$$PropertyDtoImplCopyWith<$Res> {
  __$$PropertyDtoImplCopyWithImpl(
      _$PropertyDtoImpl _value, $Res Function(_$PropertyDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? propertyId = freezed,
    Object? userId = null,
    Object? namaRumah = null,
    Object? harga = null,
    Object? tipeRumah = null,
    Object? deskripsi = null,
    Object? lokasi = null,
    Object? imageUrl = freezed,
    Object? isAvailable = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PropertyDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      namaRumah: null == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      tipeRumah: null == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      lokasi: null == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyDtoImpl implements _PropertyDto {
  const _$PropertyDtoImpl(
      {this.id,
      this.propertyId,
      required this.userId,
      required this.namaRumah,
      required this.harga,
      required this.tipeRumah,
      required this.deskripsi,
      required this.lokasi,
      this.imageUrl,
      this.isAvailable = false,
      this.createdAt,
      this.updatedAt});

  factory _$PropertyDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? propertyId;
  @override
  final int userId;
  @override
  final String namaRumah;
  @override
  final int harga;
  @override
  final String tipeRumah;
  @override
  final String deskripsi;
  @override
  final String lokasi;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isAvailable;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PropertyDto(id: $id, propertyId: $propertyId, userId: $userId, namaRumah: $namaRumah, harga: $harga, tipeRumah: $tipeRumah, deskripsi: $deskripsi, lokasi: $lokasi, imageUrl: $imageUrl, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.namaRumah, namaRumah) ||
                other.namaRumah == namaRumah) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.tipeRumah, tipeRumah) ||
                other.tipeRumah == tipeRumah) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      propertyId,
      userId,
      namaRumah,
      harga,
      tipeRumah,
      deskripsi,
      lokasi,
      imageUrl,
      isAvailable,
      createdAt,
      updatedAt);

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyDtoImplCopyWith<_$PropertyDtoImpl> get copyWith =>
      __$$PropertyDtoImplCopyWithImpl<_$PropertyDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyDtoImplToJson(
      this,
    );
  }
}

abstract class _PropertyDto implements PropertyDto {
  const factory _PropertyDto(
      {final int? id,
      final String? propertyId,
      required final int userId,
      required final String namaRumah,
      required final int harga,
      required final String tipeRumah,
      required final String deskripsi,
      required final String lokasi,
      final String? imageUrl,
      final bool isAvailable,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PropertyDtoImpl;

  factory _PropertyDto.fromJson(Map<String, dynamic> json) =
      _$PropertyDtoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get propertyId;
  @override
  int get userId;
  @override
  String get namaRumah;
  @override
  int get harga;
  @override
  String get tipeRumah;
  @override
  String get deskripsi;
  @override
  String get lokasi;
  @override
  String? get imageUrl;
  @override
  bool get isAvailable;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PropertyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyDtoImplCopyWith<_$PropertyDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PropertyTypeDto _$PropertyTypeDtoFromJson(Map<String, dynamic> json) {
  return _PropertyTypeDto.fromJson(json);
}

/// @nodoc
mixin _$PropertyTypeDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PropertyTypeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyTypeDtoCopyWith<PropertyTypeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyTypeDtoCopyWith<$Res> {
  factory $PropertyTypeDtoCopyWith(
          PropertyTypeDto value, $Res Function(PropertyTypeDto) then) =
      _$PropertyTypeDtoCopyWithImpl<$Res, PropertyTypeDto>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$PropertyTypeDtoCopyWithImpl<$Res, $Val extends PropertyTypeDto>
    implements $PropertyTypeDtoCopyWith<$Res> {
  _$PropertyTypeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyTypeDtoImplCopyWith<$Res>
    implements $PropertyTypeDtoCopyWith<$Res> {
  factory _$$PropertyTypeDtoImplCopyWith(_$PropertyTypeDtoImpl value,
          $Res Function(_$PropertyTypeDtoImpl) then) =
      __$$PropertyTypeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$PropertyTypeDtoImplCopyWithImpl<$Res>
    extends _$PropertyTypeDtoCopyWithImpl<$Res, _$PropertyTypeDtoImpl>
    implements _$$PropertyTypeDtoImplCopyWith<$Res> {
  __$$PropertyTypeDtoImplCopyWithImpl(
      _$PropertyTypeDtoImpl _value, $Res Function(_$PropertyTypeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$PropertyTypeDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyTypeDtoImpl implements _PropertyTypeDto {
  const _$PropertyTypeDtoImpl({required this.id, required this.name});

  factory _$PropertyTypeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyTypeDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'PropertyTypeDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyTypeDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of PropertyTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyTypeDtoImplCopyWith<_$PropertyTypeDtoImpl> get copyWith =>
      __$$PropertyTypeDtoImplCopyWithImpl<_$PropertyTypeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyTypeDtoImplToJson(
      this,
    );
  }
}

abstract class _PropertyTypeDto implements PropertyTypeDto {
  const factory _PropertyTypeDto(
      {required final String id,
      required final String name}) = _$PropertyTypeDtoImpl;

  factory _PropertyTypeDto.fromJson(Map<String, dynamic> json) =
      _$PropertyTypeDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of PropertyTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyTypeDtoImplCopyWith<_$PropertyTypeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePropertyResponseDto _$CreatePropertyResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _CreatePropertyResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CreatePropertyResponseDto {
  String? get message => throw _privateConstructorUsedError;
  PropertyDto get data => throw _privateConstructorUsedError;

  /// Serializes this CreatePropertyResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePropertyResponseDtoCopyWith<CreatePropertyResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePropertyResponseDtoCopyWith<$Res> {
  factory $CreatePropertyResponseDtoCopyWith(CreatePropertyResponseDto value,
          $Res Function(CreatePropertyResponseDto) then) =
      _$CreatePropertyResponseDtoCopyWithImpl<$Res, CreatePropertyResponseDto>;
  @useResult
  $Res call({String? message, PropertyDto data});

  $PropertyDtoCopyWith<$Res> get data;
}

/// @nodoc
class _$CreatePropertyResponseDtoCopyWithImpl<$Res,
        $Val extends CreatePropertyResponseDto>
    implements $CreatePropertyResponseDtoCopyWith<$Res> {
  _$CreatePropertyResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PropertyDto,
    ) as $Val);
  }

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyDtoCopyWith<$Res> get data {
    return $PropertyDtoCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatePropertyResponseDtoImplCopyWith<$Res>
    implements $CreatePropertyResponseDtoCopyWith<$Res> {
  factory _$$CreatePropertyResponseDtoImplCopyWith(
          _$CreatePropertyResponseDtoImpl value,
          $Res Function(_$CreatePropertyResponseDtoImpl) then) =
      __$$CreatePropertyResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, PropertyDto data});

  @override
  $PropertyDtoCopyWith<$Res> get data;
}

/// @nodoc
class __$$CreatePropertyResponseDtoImplCopyWithImpl<$Res>
    extends _$CreatePropertyResponseDtoCopyWithImpl<$Res,
        _$CreatePropertyResponseDtoImpl>
    implements _$$CreatePropertyResponseDtoImplCopyWith<$Res> {
  __$$CreatePropertyResponseDtoImplCopyWithImpl(
      _$CreatePropertyResponseDtoImpl _value,
      $Res Function(_$CreatePropertyResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$CreatePropertyResponseDtoImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PropertyDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePropertyResponseDtoImpl implements _CreatePropertyResponseDto {
  const _$CreatePropertyResponseDtoImpl({this.message, required this.data});

  factory _$CreatePropertyResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePropertyResponseDtoImplFromJson(json);

  @override
  final String? message;
  @override
  final PropertyDto data;

  @override
  String toString() {
    return 'CreatePropertyResponseDto(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePropertyResponseDtoImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePropertyResponseDtoImplCopyWith<_$CreatePropertyResponseDtoImpl>
      get copyWith => __$$CreatePropertyResponseDtoImplCopyWithImpl<
          _$CreatePropertyResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePropertyResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CreatePropertyResponseDto implements CreatePropertyResponseDto {
  const factory _CreatePropertyResponseDto(
      {final String? message,
      required final PropertyDto data}) = _$CreatePropertyResponseDtoImpl;

  factory _CreatePropertyResponseDto.fromJson(Map<String, dynamic> json) =
      _$CreatePropertyResponseDtoImpl.fromJson;

  @override
  String? get message;
  @override
  PropertyDto get data;

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePropertyResponseDtoImplCopyWith<_$CreatePropertyResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
