// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_flutter/characters/data/services/character_service.dart'
    as _i903;
import 'package:app_flutter/network/network_module.dart' as _i215;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i361.Interceptor>(
    () => networkModule.providePrettyDioLogger(),
    instanceName: 'PrettyDioLogger',
  );
  gh.singleton<_i361.Dio>(() => networkModule.provideDio(
        gh<String>(instanceName: 'BaseUrl'),
        gh<_i361.Interceptor>(instanceName: 'PrettyDioLogger'),
      ));
  gh.factory<_i903.CharacterService>(
      () => _i903.CharacterServiceImpl(gh<_i361.Dio>()));
  return getIt;
}

class _$NetworkModule extends _i215.NetworkModule {}