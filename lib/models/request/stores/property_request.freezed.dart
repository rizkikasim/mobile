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
  String get namaRumah => throw _privateConstructorUsedError;
  String get deskripsi => throw _privateConstructorUsedError;
  String get tipeRumah => throw _privateConstructorUsedError;
  int get harga => throw _privateConstructorUsedError;
  String get lokasi => throw _privateConstructorUsedError;
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
      {String namaRumah,
      String deskripsi,
      String tipeRumah,
      int harga,
      String lokasi,
      String? imageUrl});
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
    Object? namaRumah = null,
    Object? deskripsi = null,
    Object? tipeRumah = null,
    Object? harga = null,
    Object? lokasi = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      namaRumah: null == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      tipeRumah: null == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      lokasi: null == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
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
      {String namaRumah,
      String deskripsi,
      String tipeRumah,
      int harga,
      String lokasi,
      String? imageUrl});
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
    Object? namaRumah = null,
    Object? deskripsi = null,
    Object? tipeRumah = null,
    Object? harga = null,
    Object? lokasi = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$CreatePropertyRequestImpl(
      namaRumah: null == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      tipeRumah: null == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      lokasi: null == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
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
      {required this.namaRumah,
      required this.deskripsi,
      required this.tipeRumah,
      required this.harga,
      required this.lokasi,
      this.imageUrl});

  factory _$CreatePropertyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePropertyRequestImplFromJson(json);

  @override
  final String namaRumah;
  @override
  final String deskripsi;
  @override
  final String tipeRumah;
  @override
  final int harga;
  @override
  final String lokasi;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'CreatePropertyRequest(namaRumah: $namaRumah, deskripsi: $deskripsi, tipeRumah: $tipeRumah, harga: $harga, lokasi: $lokasi, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePropertyRequestImpl &&
            (identical(other.namaRumah, namaRumah) ||
                other.namaRumah == namaRumah) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.tipeRumah, tipeRumah) ||
                other.tipeRumah == tipeRumah) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, namaRumah, deskripsi, tipeRumah, harga, lokasi, imageUrl);

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
      {required final String namaRumah,
      required final String deskripsi,
      required final String tipeRumah,
      required final int harga,
      required final String lokasi,
      final String? imageUrl}) = _$CreatePropertyRequestImpl;

  factory _CreatePropertyRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePropertyRequestImpl.fromJson;

  @override
  String get namaRumah;
  @override
  String get deskripsi;
  @override
  String get tipeRumah;
  @override
  int get harga;
  @override
  String get lokasi;
  @override
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
  String? get namaRumah => throw _privateConstructorUsedError;
  String? get deskripsi => throw _privateConstructorUsedError;
  String? get tipeRumah => throw _privateConstructorUsedError;
  int? get harga => throw _privateConstructorUsedError;
  String? get lokasi => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
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
      {String? namaRumah,
      String? deskripsi,
      String? tipeRumah,
      int? harga,
      String? lokasi,
      String? imageUrl,
      bool? isAvailable});
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
    Object? namaRumah = freezed,
    Object? deskripsi = freezed,
    Object? tipeRumah = freezed,
    Object? harga = freezed,
    Object? lokasi = freezed,
    Object? imageUrl = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      namaRumah: freezed == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      deskripsi: freezed == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String?,
      tipeRumah: freezed == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int?,
      lokasi: freezed == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
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
      {String? namaRumah,
      String? deskripsi,
      String? tipeRumah,
      int? harga,
      String? lokasi,
      String? imageUrl,
      bool? isAvailable});
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
    Object? namaRumah = freezed,
    Object? deskripsi = freezed,
    Object? tipeRumah = freezed,
    Object? harga = freezed,
    Object? lokasi = freezed,
    Object? imageUrl = freezed,
    Object? isAvailable = freezed,
  }) {
    return _then(_$UpdatePropertyRequestImpl(
      namaRumah: freezed == namaRumah
          ? _value.namaRumah
          : namaRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      deskripsi: freezed == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String?,
      tipeRumah: freezed == tipeRumah
          ? _value.tipeRumah
          : tipeRumah // ignore: cast_nullable_to_non_nullable
              as String?,
      harga: freezed == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int?,
      lokasi: freezed == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
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
      {this.namaRumah,
      this.deskripsi,
      this.tipeRumah,
      this.harga,
      this.lokasi,
      this.imageUrl,
      this.isAvailable});

  factory _$UpdatePropertyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePropertyRequestImplFromJson(json);

  @override
  final String? namaRumah;
  @override
  final String? deskripsi;
  @override
  final String? tipeRumah;
  @override
  final int? harga;
  @override
  final String? lokasi;
  @override
  final String? imageUrl;
  @override
  final bool? isAvailable;

  @override
  String toString() {
    return 'UpdatePropertyRequest(namaRumah: $namaRumah, deskripsi: $deskripsi, tipeRumah: $tipeRumah, harga: $harga, lokasi: $lokasi, imageUrl: $imageUrl, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePropertyRequestImpl &&
            (identical(other.namaRumah, namaRumah) ||
                other.namaRumah == namaRumah) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.tipeRumah, tipeRumah) ||
                other.tipeRumah == tipeRumah) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, namaRumah, deskripsi, tipeRumah,
      harga, lokasi, imageUrl, isAvailable);

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
      {final String? namaRumah,
      final String? deskripsi,
      final String? tipeRumah,
      final int? harga,
      final String? lokasi,
      final String? imageUrl,
      final bool? isAvailable}) = _$UpdatePropertyRequestImpl;

  factory _UpdatePropertyRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePropertyRequestImpl.fromJson;

  @override
  String? get namaRumah;
  @override
  String? get deskripsi;
  @override
  String? get tipeRumah;
  @override
  int? get harga;
  @override
  String? get lokasi;
  @override
  String? get imageUrl;
  @override
  bool? get isAvailable;

  /// Create a copy of UpdatePropertyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePropertyRequestImplCopyWith<_$UpdatePropertyRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
