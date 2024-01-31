import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/constants/constants.dart';
import 'data/datasources/local/app_database.dart';
import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'data/repositories/database_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/database_repository.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

/*@injectableInit
Future<GetIt> configure() async => getIt.init();*/

@injectableInit
Future<void> configure() async {
  getIt.init();

  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  getIt.registerSingleton<AppDatabase>(db);

  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  dio.interceptors.add(AwesomeDioInterceptor());
  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<NewsApiService>(
    NewsApiService(getIt<Dio>()),
  );

  getIt.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(getIt<NewsApiService>()),
  );

  getIt.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(getIt<AppDatabase>()),
  );
}

/*
const dev = Environment('dev'); // 개발
const prod = Environment('prod'); // 실제 배포

@InjectableInit()
Future<void> configureDependencies() => getIt.init(environment: Environment.prod);
*/

/*
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);
*/
