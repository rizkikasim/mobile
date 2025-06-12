import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';

part 'property_state.freezed.dart';

@freezed
class PropertyState with _$PropertyState {
  const factory PropertyState.initial() = _Initial;
  const factory PropertyState.loading() = _Loading;
  const factory PropertyState.success(List<PropertyDto> properties) = _Success;
  const factory PropertyState.detail(PropertyDto property) = _Detail;

  /// ✅ Bawa data properti yang baru dibuat
  const factory PropertyState.created(PropertyDto property) = _Created;

  const factory PropertyState.updated() = _Updated;
  const factory PropertyState.deleted() = _Deleted;
  const factory PropertyState.error(String message) = _Error;
}
