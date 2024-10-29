import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {

  @Named('BaseUrl')
  String get baseUrl => 'https://rickandmortyapi.com/api/';

  @Named('PrettyDioLogger')
  Interceptor providePrettyDioLogger() => PrettyDioLogger();

  @singleton
  Dio provideDio(
    @Named('BaseUrl') String baseUrl,
    @Named('PrettyDioLogger') Interceptor prettyDioLogger,
    
    
    ) => 
      Dio(
        BaseOptions(baseUrl: baseUrl),
      )..interceptors.add(providePrettyDioLogger());
}