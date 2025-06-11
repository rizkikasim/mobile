// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatePropertyRequest _$CreatePropertyRequestFromJson(
    Map<String, dynamic> json) {
  return _CreatePropertyRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePropertyRequest {
  @JsonKey(name: 'nama_rumah')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'deskripsi')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipe_rumah')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'lokasi')
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this CreatePropertyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePropertyRequestCopyWith<CreatePropertyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePropertyRequestCopyWith<$Res> {
  factory $CreatePropertyRequestCopyWith(CreatePropertyRequest value,
          $Res Function(CreatePropertyRequest) then) =
      _$CreatePropertyRequestCopyWithImpl<$Res, CreatePropertyRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'nama_rumah') String title,
      @JsonKey(name: 'deskripsi') String description,
      @JsonKey(name: 'tipe_rumah') String type,
      @JsonKey(name: 'harga') int price,
      @JsonKey(name: 'lokasi') String location,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$CreatePropertyRequestCopyWithImpl<$Res,
        $Val extends CreatePropertyRequest>
    implements $CreatePropertyRequestCopyWith<$Res> {
  _$CreatePropertyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? price = null,
    Object? location = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePropertyRequestImplCopyWith<$Res>
    implements $CreatePropertyRequestCopyWith<$Res> {
  factory _$$CreatePropertyRequestImplCopyWith(
          _$CreatePropertyRequestImpl value,
          $Res Function(_$CreatePropertyRequestImpl) then) =
      __$$CreatePropertyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'nama_rumah') String title,
      @JsonKey(name: 'deskripsi') String description,
      @JsonKey(name: 'tipe_rumah') String type,
      @JsonKey(name: 'harga') int price,
      @JsonKey(name: 'lokasi') String location,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$$CreatePropertyRequestImplCopyWithImpl<$Res>
    extends _$CreatePropertyRequestCopyWithImpl<$Res,
        _$CreatePropertyRequestImpl>
    implements _$$CreatePropertyRequestImplCopyWith<$Res> {
  __$$CreatePropertyRequestImplCopyWithImpl(_$CreatePropertyRequestImpl _value,
      $Res Function(_$CreatePropertyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? price = null,
    Object? location = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$CreatePropertyRequestImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePropertyRequestImpl implements _CreatePropertyRequest {
  const _$CreatePropertyRequestImpl(
      {@JsonKey(name: 'nama_rumah') required this.title,
      @JsonKey(name: 'deskripsi') required this.description,
      @JsonKey(name: 'tipe_rumah') required this.type,
      @JsonKey(name: 'harga') required this.price,
      @JsonKey(name: 'lokasi') required this.location,
      @JsonKey(name: 'image_url') this.imageUrl});

  factory _$CreatePropertyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePropertyRequestImplFromJson(json);

  @override
  @JsonKey(name: 'nama_rumah')
  final String title;
  @override
  @JsonKey(name: 'deskripsi')
  final String description;
  @override
  @JsonKey(name: 'tipe_rumah')
  final String type;
  @override
  @JsonKey(name: 'harga')
  final int price;
  @override
  @JsonKey(name: 'lokasi')
  final String location;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'CreatePropertyRequest(title: $title, description: $description, type: $type, price: $price, location: $location, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePropertyRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, description, type, price, location, imageUrl);

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePropertyRequestImplCopyWith<_$CreatePropertyRequestImpl>
      get copyWith => __$$CreatePropertyRequestImplCopyWithImpl<
          _$CreatePropertyRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePropertyRequestImplToJson(
      this,
    );
  }
}

abstract class _CreatePropertyRequest implements CreatePropertyRequest {
  const factory _CreatePropertyRequest(
          {@JsonKey(name: 'nama_rumah') required final String title,
          @JsonKey(name: 'deskripsi') required final String description,
          @JsonKey(name: 'tipe_rumah') required final String type,
          @JsonKey(name: 'harga') required final int price,
          @JsonKey(name: 'lokasi') required final String location,
          @JsonKey(name: 'image_url') final String? imageUrl}) =
      _$CreatePropertyRequestImpl;

  factory _CreatePropertyRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePropertyRequestImpl.fromJson;

  @override
  @JsonKey(name: 'nama_rumah')
  String get title;
  @override
  @JsonKey(name: 'deskripsi')
  String get description;
  @override
  @JsonKey(name: 'tipe_rumah')
  String get type;
  @override
  @JsonKey(name: 'harga')
  int get price;
  @override
  @JsonKey(name: 'lokasi')
  String get location;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of CreatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePropertyRequestImplCopyWith<_$CreatePropertyRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdatePropertyRequest _$UpdatePropertyRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdatePropertyRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePropertyRequest {
  @JsonKey(name: 'nama_rumah')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'deskripsi')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipe_rumah')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'lokasi')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool? get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this UpdatePropertyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePropertyRequestCopyWith<UpdatePropertyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePropertyRequestCopyWith<$Res> {
  factory $UpdatePropertyRequestCopyWith(UpdatePropertyRequest value,
          $Res Function(UpdatePropertyRequest) then) =
      _$UpdatePropertyRequestCopyWithImpl<$Res, UpdatePropertyRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'nama_rumah') String? title,
      @JsonKey(name: 'deskripsi') String? description,
      @JsonKey(name: 'tipe_rumah') String? type,
      @JsonKey(name: 'harga') int? price,
      @JsonKey(name: 'lokasi') String? location,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_available') bool? isAvailable});
}

/// @nodoc
class _$UpdatePropertyRequestCopyWithImpl<$Res,
        $Val extends UpdatePropertyRequest>
    implements $UpdatePropertyRequestCopyWith<$Res> {
  _$UpdatePropertyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePropertyRequestImplCopyWith<$Res>
    implements $UpdatePropertyRequestCopyWith<$Res> {
  factory _$$UpdatePropertyRequestImplCopyWith(
          _$UpdatePropertyRequestImpl value,
          $Res Function(_$UpdatePropertyRequestImpl) then) =
      __$$UpdatePropertyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'nama_rumah') String? title,
      @JsonKey(name: 'deskripsi') String? description,
      @JsonKey(name: 'tipe_rumah') String? type,
      @JsonKey(name: 'harga') int? price,
      @JsonKey(name: 'lokasi') String? location,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_available') bool? isAvailable});
}

/// @nodoc
class __$$UpdatePropertyRequestImplCopyWithImpl<$Res>
    extends _$UpdatePropertyRequestCopyWithImpl<$Res,
        _$UpdatePropertyRequestImpl>
    implements _$$UpdatePropertyRequestImplCopyWith<$Res> {
  __$$UpdatePropertyRequestImplCopyWithImpl(_$UpdatePropertyRequestImpl _value,
      $Res Function(_$UpdatePropertyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_$UpdatePropertyRequestImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePropertyRequestImpl implements _UpdatePropertyRequest {
  const _$UpdatePropertyRequestImpl(
      {@JsonKey(name: 'nama_rumah') this.title,
      @JsonKey(name: 'deskripsi') this.description,
      @JsonKey(name: 'tipe_rumah') this.type,
      @JsonKey(name: 'harga') this.price,
      @JsonKey(name: 'lokasi') this.location,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'is_available') this.isAvailable});

  factory _$UpdatePropertyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePropertyRequestImplFromJson(json);

  @override
  @JsonKey(name: 'nama_rumah')
  final String? title;
  @override
  @JsonKey(name: 'deskripsi')
  final String? description;
  @override
  @JsonKey(name: 'tipe_rumah')
  final String? type;
  @override
  @JsonKey(name: 'harga')
  final int? price;
  @override
  @JsonKey(name: 'lokasi')
  final String? location;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_available')
  final bool? isAvailable;

  @override
  String toString() {
    return 'UpdatePropertyRequest(title: $title, description: $description, type: $type, price: $price, location: $location, imageUrl: $imageUrl, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePropertyRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, type, price,
      location, imageUrl, isAvailable);

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePropertyRequestImplCopyWith<_$UpdatePropertyRequestImpl>
      get copyWith => __$$UpdatePropertyRequestImplCopyWithImpl<
          _$UpdatePropertyRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePropertyRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdatePropertyRequest implements UpdatePropertyRequest {
  const factory _UpdatePropertyRequest(
          {@JsonKey(name: 'nama_rumah') final String? title,
          @JsonKey(name: 'deskripsi') final String? description,
          @JsonKey(name: 'tipe_rumah') final String? type,
          @JsonKey(name: 'harga') final int? price,
          @JsonKey(name: 'lokasi') final String? location,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'is_available') final bool? isAvailable}) =
      _$UpdatePropertyRequestImpl;

  factory _UpdatePropertyRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePropertyRequestImpl.fromJson;

  @override
  @JsonKey(name: 'nama_rumah')
  String? get title;
  @override
  @JsonKey(name: 'deskripsi')
  String? get description;
  @override
  @JsonKey(name: 'tipe_rumah')
  String? get type;
  @override
  @JsonKey(name: 'harga')
  int? get price;
  @override
  @JsonKey(name: 'lokasi')
  String? get location;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'is_available')
  bool? get isAvailable;

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePropertyRequestImplCopyWith<_$UpdatePropertyRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
