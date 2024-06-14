import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/pages/detail/data/repository_impl/detail_repository_impl.dart';
import 'package:flutter_pokedex/src/pages/detail/data/services/detail_api_service.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/repositories/detail_repository.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/usecases/detail_usecase.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/bloc/remote/detail_data_bloc.dart';
import 'package:flutter_pokedex/src/pages/home/data/repositories_impl/home_repository_impl.dart';
import 'package:flutter_pokedex/src/pages/home/data/services/home_api_service.dart';
import 'package:flutter_pokedex/src/pages/home/domain/repositories/home_repository.dart';
import 'package:flutter_pokedex/src/pages/home/domain/usecases/home_usecase.dart';
import 'package:flutter_pokedex/src/pages/home/presentation/bloc/remote/home_data_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(
    AwesomeDioInterceptor(
        logRequestHeaders: false,
        logRequestTimeout: false,
        logResponseHeaders: false,
        logger: debugPrint),
  );

  // common injections
  sl.registerSingleton<Dio>(dio);

  // service injections
  sl.registerSingleton<HomeApiService>(HomeApiService(sl()));
  sl.registerSingleton<DetailApiService>(DetailApiService(sl()));

  // repository injections
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl(sl()));
  sl.registerSingleton<DetailRepository>(DetailRepositoryImpl(sl()));

  // usecase injections
  sl.registerSingleton<HomeUseCase>(HomeUseCase(sl()));
  sl.registerSingleton<DetailUsecase>(DetailUsecase(sl()));

  // bloc injections
  sl.registerFactory<HomeDataBloc>(() => HomeDataBloc(sl()));
  sl.registerFactory<DetailDataBloc>(() => DetailDataBloc(sl()));
}
