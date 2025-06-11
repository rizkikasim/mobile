import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/models/request/stores/property_request.dart';
import 'package:propedia/services/stores/properties_api_services.dart';
import 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertiesApiService _api;

  PropertyCubit(this._api) : super(const PropertyState.initial());

  Future<void> fetchAllProperties(String role) async {
    emit(const PropertyState.loading());
    try {
      List<PropertyDto> result;

      if (role == 'pembeli') {
        result = await _api.getBuyerProperties();
      } else {
        result = await _api.getMyProperties(role); // ✅ sesuai API baru
      }

      emit(PropertyState.success(result));
    } catch (e) {
      emit(PropertyState.error("Gagal ambil properti: ${e.toString()}"));
    }
  }

  Future<void> getDetail(String role, String propertyId) async {
    emit(const PropertyState.loading());
    try {
      final property = (role == 'pembeli')
          ? await _api.getBuyerPropertyDetail(propertyId)
          : await _api.getPropertyDetail(role, propertyId); // ✅ tanpa ID user
      emit(PropertyState.detail(property));
    } catch (e) {
      emit(PropertyState.error("Gagal ambil detail: ${e.toString()}"));
    }
  }

  Future<void> create(String role, CreatePropertyRequest request) async {
    emit(const PropertyState.loading());
    try {
      await _api.createProperty(role, request);
      emit(const PropertyState.created());
    } catch (e) {
      emit(PropertyState.error("Gagal buat properti: ${e.toString()}"));
    }
  }

  Future<void> update(String role, String propertyId, UpdatePropertyRequest request) async {
    emit(const PropertyState.loading());
    try {
      await _api.updateProperty(role, propertyId, request);
      emit(const PropertyState.updated());
    } catch (e) {
      emit(PropertyState.error("Gagal update properti: ${e.toString()}"));
    }
  }

  Future<void> delete(String role, String propertyId) async {
    emit(const PropertyState.loading());
    try {
      await _api.deleteProperty(role, propertyId);
      emit(const PropertyState.deleted());
    } catch (e) {
      emit(PropertyState.error("Gagal hapus properti: ${e.toString()}"));
    }
  }
}
