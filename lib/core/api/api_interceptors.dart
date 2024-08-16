import 'package:api_connect_flutter/cache/cache_helper.dart';
import 'package:api_connect_flutter/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] = CacheHelper().getData(key: ApiKey.token);

    super.onRequest(options, handler);
  }
}
