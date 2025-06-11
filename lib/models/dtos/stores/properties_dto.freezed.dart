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
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_id')
  String get propertyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_rumah')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipe_rumah')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'deskripsi')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'lokasi')
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'property_id') String propertyId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'nama_rumah') String title,
      @JsonKey(name: 'harga') int price,
      @JsonKey(name: 'tipe_rumah') String type,
      @JsonKey(name: 'deskripsi') String description,
      @JsonKey(name: 'lokasi') String location,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
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
    Object? id = null,
    Object? propertyId = null,
    Object? userId = null,
    Object? title = null,
    Object? price = null,
    Object? type = null,
    Object? description = null,
    Object? location = null,
    Object? imageUrl = freezed,
    Object? isAvailable = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'property_id') String propertyId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'nama_rumah') String title,
      @JsonKey(name: 'harga') int price,
      @JsonKey(name: 'tipe_rumah') String type,
      @JsonKey(name: 'deskripsi') String description,
      @JsonKey(name: 'lokasi') String location,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
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
    Object? id = null,
    Object? propertyId = null,
    Object? userId = null,
    Object? title = null,
    Object? price = null,
    Object? type = null,
    Object? description = null,
    Object? location = null,
    Object? imageUrl = freezed,
    Object? isAvailable = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PropertyDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'property_id') required this.propertyId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'nama_rumah') required this.title,
      @JsonKey(name: 'harga') required this.price,
      @JsonKey(name: 'tipe_rumah') required this.type,
      @JsonKey(name: 'deskripsi') required this.description,
      @JsonKey(name: 'lokasi') required this.location,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'is_available') this.isAvailable = false,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PropertyDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'property_id')
  final String propertyId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'nama_rumah')
  final String title;
  @override
  @JsonKey(name: 'harga')
  final int price;
  @override
  @JsonKey(name: 'tipe_rumah')
  final String type;
  @override
  @JsonKey(name: 'deskripsi')
  final String description;
  @override
  @JsonKey(name: 'lokasi')
  final String location;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PropertyDto(id: $id, propertyId: $propertyId, userId: $userId, title: $title, price: $price, type: $type, description: $description, location: $location, imageUrl: $imageUrl, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
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
      title,
      price,
      type,
      description,
      location,
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
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'property_id') required final String propertyId,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'nama_rumah') required final String title,
          @JsonKey(name: 'harga') required final int price,
          @JsonKey(name: 'tipe_rumah') required final String type,
          @JsonKey(name: 'deskripsi') required final String description,
          @JsonKey(name: 'lokasi') required final String location,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'is_available') final bool isAvailable,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PropertyDtoImpl;

  factory _PropertyDto.fromJson(Map<String, dynamic> json) =
      _$PropertyDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'property_id')
  String get propertyId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'nama_rumah')
  String get title;
  @override
  @JsonKey(name: 'harga')
  int get price;
  @override
  @JsonKey(name: 'tipe_rumah')
  String get type;
  @override
  @JsonKey(name: 'deskripsi')
  String get description;
  @override
  @JsonKey(name: 'lokasi')
  String get location;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
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
  @JsonKey(name: 'data')
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
  $Res call({String? message, @JsonKey(name: 'data') PropertyDto data});

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
  $Res call({String? message, @JsonKey(name: 'data') PropertyDto data});

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
  const _$CreatePropertyResponseDtoImpl(
      {this.message, @JsonKey(name: 'data') required this.data});

  factory _$CreatePropertyResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePropertyResponseDtoImplFromJson(json);

  @override
  final String? message;
  @override
  @JsonKey(name: 'data')
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
          @JsonKey(name: 'data') required final PropertyDto data}) =
      _$CreatePropertyResponseDtoImpl;

  factory _CreatePropertyResponseDto.fromJson(Map<String, dynamic> json) =
      _$CreatePropertyResponseDtoImpl.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(name: 'data')
  PropertyDto get data;

  /// Create a copy of CreatePropertyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePropertyResponseDtoImplCopyWith<_$CreatePropertyResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
