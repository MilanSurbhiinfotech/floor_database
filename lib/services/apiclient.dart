

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'apiclient.g.dart';

@RestApi(baseUrl: "https://data-platform.surbhiinfotech.com/api")
abstract class ApiClient{

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
}