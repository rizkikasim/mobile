import 'package:dio/dio.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/models/request/stores/property_request.dart';
import 'package:retrofit/retrofit.dart';

part 'properties_api_services.g.dart';

@RestApi()
abstract class PropertiesApiService {
  factory PropertiesApiService(Dio dio, {String baseUrl}) = _PropertiesApiService;

  @POST('/api/{role}/properties')
  Future<PropertyDto> createProperty(
    @Path('role') String role,
    @Body() CreatePropertyRequest request,
  );

  @GET('/api/property-types')
  Future<List<PropertyTypeDto>> getPropertyTypes();

  @GET('/api/{role}/properties')
  Future<List<PropertyDto>> getMyProperties(
    @Path('role') String role,
  );

  @GET('/api/{role}/properties/property/{propertyId}')
  Future<PropertyDto> getPropertyDetail(
    @Path('role') String role,
    @Path('propertyId') String propertyId,
  );

  @PATCH('/api/{role}/properties/property/{propertyId}')
  Future<PropertyDto> updateProperty(
    @Path('role') String role,
    @Path('propertyId') String propertyId,
    @Body() UpdatePropertyRequest request,
  );

  @DELETE('/api/{role}/properties/property/{propertyId}')
  Future<void> deleteProperty(
    @Path('role') String role,
    @Path('propertyId') String propertyId,
  );

  @GET('/api/pembeli/properties')
  Future<List<PropertyDto>> getBuyerProperties();

  @GET('/api/pembeli/properties/property/{propertyId}')
  Future<PropertyDto> getBuyerPropertyDetail(
    @Path('propertyId') String propertyId,
  );
}
