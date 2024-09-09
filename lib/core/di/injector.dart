import 'package:damoim/core/const/data.dart';
import 'package:damoim/core/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/core/data/datasource/remote/remote_data_source_impl.dart';
import 'package:damoim/core/data/network/custom_interceptor.dart';
import 'package:damoim/core/data/repository/app_repository_impl.dart';
import 'package:damoim/core/data/repository/group_repository_impl.dart';
import 'package:damoim/core/data/repository/user_repository_impl.dart';
import 'package:damoim/core/domain/repository/app_repository.dart';
import 'package:damoim/core/domain/repository/group_repository.dart';
import 'package:damoim/core/domain/repository/user_repository.dart';
import 'package:damoim/core/domain/usecase/app_version_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void initSingletons() {
  injector.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options = BaseOptions(baseUrl: BASE_URL);
    dio.interceptors.add(
      CustomInterceptor(),
    );
    return dio;
  });
}

void provideDataSources() {
  injector.registerFactory<RemoteDataSource>(
    () => RemoteDataSourceImpl(dio: injector.get<Dio>()),
  );
}

void provideRepositories() {
  injector.registerFactory<AppRepository>(
    () => AppRepositoryImpl(remoteDataSource: injector.get<RemoteDataSource>()),
  );
  injector.registerFactory<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: injector.get<RemoteDataSource>()),
  );
  injector.registerFactory<GroupRepository>(
    () => GroupRepositoryImpl(remoteDataSource: injector.get<RemoteDataSource>()),
  );
}

void provideUseCases() {
  injector
      .registerFactory<AppVersionUseCase>(() => AppVersionUseCase(injector.get<AppRepository>()));
}
