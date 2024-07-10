import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tvs_app/core/services/api_service.dart';
import 'package:tvs_app/tvs/data/datasource/tvs_remote_data_source.dart';
import 'package:tvs_app/tvs/data/repository/tvs_repository.dart';
import 'package:tvs_app/tvs/domain/repository/base_tvs_repository.dart';
import 'package:tvs_app/tvs/domain/usecases/get_on_the_air_tvs_usecase.dart';
import 'package:tvs_app/tvs/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:tvs_app/tvs/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:tvs_app/tvs/domain/usecases/get_tv_details_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // api service
    sl.registerLazySingleton<ApiService>(() => ApiService(Dio()));

    // Repositories

    sl.registerLazySingleton<BaseTvsRepository>(() => TvsRepository(sl()));

    // DataSources

    sl.registerLazySingleton<BaseTvsRemoteDataSource>(
      () => TvsRemoteDataSource(
        sl(),
      ),
    );

    // UseCases

    sl.registerLazySingleton<GetOnTheAirTvsUseCase>(
        () => GetOnTheAirTvsUseCase(sl()));
    sl.registerLazySingleton<GetPopularTvsUseCase>(
        () => GetPopularTvsUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedTvsUseCase>(
        () => GetTopRatedTvsUseCase(sl()));

    sl.registerLazySingleton<GetTvDetailsUseCase>(
        () => GetTvDetailsUseCase(sl()));
  }
}
