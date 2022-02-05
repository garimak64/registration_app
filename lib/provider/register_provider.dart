import 'package:dio/dio.dart';
import 'package:registration_app/model/register_request.dart';
import 'package:registration_app/model/register_response.dart';

import 'register_api.dart';

class RegisterProvider {
  late RegisterApi _getRegisterApi;
  late Dio _dio;

  RegisterProvider(Dio dio) {
    _dio = dio;
    _getRegisterApi = RegisterApi(_dio);
  }

  Future<RegisterResponse> register(RegistrationRequest data) async {
    return _getRegisterApi.getRegistrationInfo(data);
  }
}