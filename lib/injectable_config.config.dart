// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:store_ads/core/api/dio_client.dart' as _i88;
import 'package:store_ads/core/api/dio_client_impl.dart' as _i730;
import 'package:store_ads/core/configs/app_configuration.dart' as _i270;
import 'package:store_ads/core/configs/configuration.dart' as _i233;
import 'package:store_ads/core/interceptors/logging_interceptor.dart' as _i678;
import 'package:store_ads/core/interceptors/token_interceptor.dart' as _i282;
import 'package:store_ads/core/permissions/permission_manager.dart' as _i253;
import 'package:store_ads/core/storage/local_storage_service.dart' as _i645;
import 'package:store_ads/features/main_feature/data/datasources/remote/ad_remote_data_source.dart'
    as _i338;
import 'package:store_ads/features/main_feature/data/datasources/remote/ad_remote_data_source_imp.dart'
    as _i601;
import 'package:store_ads/features/main_feature/data/repo_imp/ad_repo_imp.dart'
    as _i1038;
import 'package:store_ads/features/main_feature/domain/repo/ad_repo.dart'
    as _i86;
import 'package:store_ads/features/main_feature/domain/usecases/get_ads_with_filter_use_case.dart'
    as _i265;
import 'package:store_ads/injectable_modules.dart' as _i635;

const String _staging = 'staging';
const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final utilsModule = _$UtilsModule();
    gh.lazySingleton<_i270.AppConfiguration>(() => _i270.AppConfiguration());
    gh.lazySingleton<_i678.LoggingInterceptor>(
        () => _i678.LoggingInterceptor());
    gh.lazySingleton<_i253.PermissionManager>(() => _i253.PermissionManager());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dioInstance);
    gh.lazySingleton<_i361.CancelToken>(() => networkModule.compute());
    gh.lazySingleton<_i792.GetStorage>(() => utilsModule.getStorage);
    gh.lazySingleton<_i645.LocalStorageService>(
        () => _i645.LocalStorageServiceImp(gh<_i792.GetStorage>()));
    gh.lazySingleton<_i282.TokenInterceptor>(
        () => _i282.TokenInterceptor(getStorage: gh<_i792.GetStorage>()));
    gh.lazySingleton<_i233.Configuration>(
      () => _i233.StagingConfiguration(),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i233.Configuration>(
      () => _i233.DevConfiguration(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i88.IDioClient>(
        () => _i730.DioClient(client: gh<_i361.Dio>()));
    gh.lazySingleton<_i233.Configuration>(
      () => _i233.ProductionConfiguration(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i338.AdRemoteDataSource>(
        () => _i601.AdRemoteDataSourceImp(dioClient: gh<_i88.IDioClient>()));
    gh.lazySingleton<_i86.AdRepo>(
        () => _i1038.AdRepoImp(remote: gh<_i338.AdRemoteDataSource>()));
    gh.lazySingleton<_i265.GetAdsWithFilterUseCase>(
        () => _i265.GetAdsWithFilterUseCase(adRepo: gh<_i86.AdRepo>()));
    return this;
  }
}

class _$NetworkModule extends _i635.NetworkModule {}

class _$UtilsModule extends _i635.UtilsModule {}
