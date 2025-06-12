import 'package:flutter/material.dart';
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
      debugPrint('❌ Error fetchAllProperties: $e');
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
      debugPrint('❌ Error getDetail: $e');
      emit(PropertyState.error("Gagal ambil detail: ${e.toString()}"));
    }
  }

Future<void> create(String role, CreatePropertyRequest request, String? token) async {
  emit(const PropertyState.loading());
  try {
    final response = await _api.createProperty(role, request, 'Bearer $token');

    // ✅ Logging isi respon
    debugPrint("✅ Property created:");
    debugPrint("📦 JSON: ${response.toJson()}");

    // response is already a PropertyDto, langsung emit
    emit(PropertyState.created(response));
  } catch (e, stack) {
    debugPrint("❌ Gagal createProperty: $e");
    debugPrint("📌 Stacktrace: $stack");
    emit(PropertyState.error("Gagal buat properti: ${e.toString()}"));
  }
}


  Future<void> update(String role, String propertyId, UpdatePropertyRequest request, String? token) async {
    emit(const PropertyState.loading());
    try {
      await _api.updateProperty(role, propertyId, request, 'Bearer $token');
      emit(const PropertyState.updated());
    } catch (e) {
      debugPrint('❌ Error updateProperty: $e');
      emit(PropertyState.error("Gagal update properti: ${e.toString()}"));
    }
  }

  Future<void> delete(String role, String propertyId, String? token) async {
    emit(const PropertyState.loading());
    try {
      await _api.deleteProperty(role, propertyId, 'Bearer $token');
      emit(const PropertyState.deleted());
    } catch (e) {
      debugPrint('❌ Error deleteProperty: $e');
      emit(PropertyState.error("Gagal hapus properti: ${e.toString()}"));
    }
  }

  Future<List<String>> getPropertyTypes(String? token) async {
    try {
      final result = await _api.getPropertyTypes('Bearer $token');
      debugPrint("📦 getPropertyTypes: ${result.types}");
      return result.types;
    } catch (e) {
      debugPrint('❌ Error getPropertyTypes: $e');
      throw Exception('Gagal ambil tipe properti: $e');
    }
  }
}
