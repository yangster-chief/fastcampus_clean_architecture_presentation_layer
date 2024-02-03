import 'package:clean_architecture_layer_exam/data/remote/remote_data_source.dart';
import 'package:clean_architecture_layer_exam/data/remote/remote_intercepter.dart';
import 'package:clean_architecture_layer_exam/di/hive/hive_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';

///
/// clean_architecture_layer_exam
/// File Name: app_module
/// Created by sujangmac
///
/// Description:
///
@module
abstract class AppModule {
  @preResolve
  Future<HiveService> get hiveService => HiveService.init();

  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.addAll([
      LoggyDioInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        requestLevel: LogLevel.all,
        responseLevel: LogLevel.all,
        errorLevel: LogLevel.all,
      ),
      RemoteInterceptor(),
    ]);
  @lazySingleton
  RemoteDataSource get remoteDataSource => RemoteDataSource(dio);
}
