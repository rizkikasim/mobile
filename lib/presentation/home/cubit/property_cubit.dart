import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/models/request/stores/property_request.dart';
import 'package:propedia/services/stores/properties_api_services.dart';
import 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertiesApiService _api;

  PropertyCubit(this._api) : super(const PropertyState.initial());

  Future<void> fetchAllProperties(String role, String? token) async {
    emit(const PropertyState.loading());
    try {
      List<PropertyDto> result;

      if (role == 'pembeli') {
        result = await _api.getBuyerProperties();
      } else {
        result = await _api.getMyProperties(role, 'Bearer $token');
      }

      emit(PropertyState.success(result));
    } catch (e) {
      emit(PropertyState.error("Gagal ambil properti: ${e.toString()}"));
    }
  }

  Future<void> getDetail(String role, String propertyId, String? token) async {
    emit(const PropertyState.loading());
    try {
      final property = (role == 'pembeli')
          ? await _api.getBuyerPropertyDetail(propertyId)
          : await _api.getPropertyDetail(role, propertyId, 'Bearer $token');
      emit(PropertyState.detail(property));
    } catch (e) {
      emit(PropertyState.error("Gagal ambil detail: ${e.toString()}"));
    }
  }

  Future<void> create(String role, CreatePropertyRequest request, String? token) async {
    emit(const PropertyState.loading());
    try {
      await _api.createProperty(role, request, 'Bearer $token');
      emit(const PropertyState.created());
    } catch (e) {
      emit(PropertyState.error("Gagal buat properti: ${e.toString()}"));
    }
  }

  Future<void> update(String role, String propertyId, UpdatePropertyRequest request, String? token) async {
    emit(const PropertyState.loading());
    try {
      await _api.updateProperty(role, propertyId, request, 'Bearer $token');
      emit(const PropertyState.updated());
    } catch (e) {
      emit(PropertyState.error("Gagal update properti: ${e.toString()}"));
    }
  }

  Future<void> delete(String role, String propertyId, String? token) async {
    emit(const PropertyState.loading());
    try {
      await _api.deleteProperty(role, propertyId, 'Bearer $token');
      emit(const PropertyState.deleted());
    } catch (e) {
      emit(PropertyState.error("Gagal hapus properti: ${e.toString()}"));
    }
  }

  Future<List<PropertyTypeDto>> getPropertyTypes(String? token) async {
    try {
      return await _api.getPropertyTypes('Bearer $token');
    } catch (e) {
      throw Exception('Gagal ambil tipe properti: $e');
    }
  }
}
