import 'package:clean_architecture_layer_exam/constants.dart';
import 'package:dio/dio.dart';

///
/// clean_architecture_layer_exam
/// File Name: remote_intercepter
/// Created by sujangmac
///
/// Description:
///
class RemoteInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) =>
      handler.next(err);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] = Constants.apiKey;
    return handler.next(options);
  }

  @override
  void onResponse(
          Response<dynamic> response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
