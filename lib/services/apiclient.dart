

import 'package:dio/dio.dart';
import 'package:flutter_floor/services/response/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'apiclient.g.dart';

@RestApi(baseUrl: "https://data-platform.surbhiinfotech.com/api")
abstract class ApiClient{

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/login')
  @MultiPart()
  Future<LoginResponse> login(
      @Header("Content-Type") String header,
      @Part() String role,
      @Part() String email,
      @Part() String password,
      @Part() String token);

}