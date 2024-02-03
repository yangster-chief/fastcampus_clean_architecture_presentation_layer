// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture_layer_exam/data/data_repository_impl.dart'
    as _i8;
import 'package:clean_architecture_layer_exam/data/local/local_datasource.dart'
    as _i5;
import 'package:clean_architecture_layer_exam/data/remote/remote_data_source.dart'
    as _i6;
import 'package:clean_architecture_layer_exam/di/app_module.dart' as _i9;
import 'package:clean_architecture_layer_exam/di/hive/hive_service.dart' as _i4;
import 'package:clean_architecture_layer_exam/domain/data_repository.dart'
    as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.dio);
    await gh.factoryAsync<_i4.HiveService>(
      () => appModule.hiveService,
      preResolve: true,
    );
    gh.singleton<_i5.LocalDataSource>(
      _i5.LocalDataSource(gh<_i4.HiveService>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i6.RemoteDataSource>(() => appModule.remoteDataSource);
    gh.lazySingleton<_i7.DataRepository>(() => _i8.DataRepositoryImpl(
          gh<_i6.RemoteDataSource>(),
          gh<_i5.LocalDataSource>(),
        ));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
