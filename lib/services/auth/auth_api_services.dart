import 'package:dio/dio.dart';
import 'package:propedia/presentation/core/constant/api_constant.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/api/admin/register')
  Future<HttpResponse> adminRegister(@Body() requestBody);

  @POST('/api/admin/login')
  Future<HttpResponse> adminLogin(@Body() requestBody);

  @GET('/api/admin/me')
  Future<HttpResponse> adminGetMyProfile();

  @PATCH('/api/admin/profile/{id}')
  Future<HttpResponse> adminUpdateProfile(
    @Path('id') String id,
    @Body() updates,
  );

  @POST('/api/admin/logout/{id}')
  Future<HttpResponse<void>> adminLogout(@Path('id') String id);

  @POST('/api/penjual/register')
  Future<HttpResponse> penjualRegister(@Body() requestBody);

  @POST('/api/penjual/login')
  Future<HttpResponse> penjualLogin(@Body() requestBody);

  @GET('/api/penjual/me')
  Future<HttpResponse> penjualGetMyProfile();

  @PATCH('/api/penjual/profile/{id}')
  Future<HttpResponse> penjualUpdateProfile(
    @Path('id') String id,
    @Body() updates,
  );

  @POST('/api/penjual/logout/{id}')
  Future<HttpResponse<void>> penjualLogout(@Path('id') String id);

  @POST('/api/pembeli/register')
  Future<HttpResponse> pembeliRegister(@Body() requestBody);

  @POST('/api/pembeli/login')
  Future<HttpResponse> pembeliLogin(@Body() requestBody);

  @GET('/api/pembeli/me')
  Future<HttpResponse> pembeliGetMyProfile();

  @PATCH('/api/pembeli/profile/{id}')
  Future<HttpResponse> pembeliUpdateProfile(
    @Path('id') String id,
    @Body() updates,
  );

  @POST('/api/otp/send')
  Future<HttpResponse> sendOtp(@Body() requestBody);

  @POST('/api/otp/verify')
  Future<HttpResponse> verifyOtp(@Body() requestBody);

  @POST('/api/pembeli/logout/{id}')
  Future<HttpResponse<void>> pembeliLogout(@Path('id') String id);
}
