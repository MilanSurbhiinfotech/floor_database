
import 'package:dio/dio.dart';
import 'package:flutter_floor/services/response/base_response.dart';
import 'package:flutter_floor/services/response/login_response.dart';
import 'package:flutter_floor/services/server_error.dart';

import 'apiclient.dart';

class ApiServices{

  ApiClient apiClient = ApiClient(Dio(BaseOptions(
      connectTimeout: 60000,
      receiveTimeout: 120000,
      headers: <String, dynamic>{
        "Token":
        "IAbza1VGScBEesSbcCzdnUoVuy2oQjYj8xFt8X3gOQN6IpBXYoUE5fGrTGRJeqn0OCtmZbF06fG5Z1N5 ",
      })));

  Future<BaseResponse<LoginResponse>> login(
      String email, String password, String role, String token) async {
    var response;
    try {
      response = await apiClient.login(
          "application/json", role, email, password, token);
    } catch (error, stacktrace) {

      return BaseResponse()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return BaseResponse()..data = response;
  }
}