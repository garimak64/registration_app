import 'package:dio/dio.dart';
import 'package:registration_app/model/register_request.dart';
import 'package:registration_app/model/register_response.dart';
import 'package:retrofit/http.dart';

part 'register_api.g.dart';

@RestApi()
abstract class RegisterApi {
  factory RegisterApi(Dio dio, {String baseUrl}) = _RegisterApi;

  @POST('/register')
  Future<RegisterResponse> getRegistrationInfo(@Body() RegistrationRequest registerInfo);
}
