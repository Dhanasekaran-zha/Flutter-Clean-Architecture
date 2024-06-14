import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/src/base/base_repository.dart';
import 'package:flutter_pokedex/src/base/data_state.dart';
import 'package:flutter_pokedex/src/pages/detail/data/mappers/pokemon_stats_mappers.dart';
import 'package:flutter_pokedex/src/pages/detail/data/services/detail_api_service.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/entities/stats_entity.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl extends BaseRepository implements DetailRepository {
  final DetailApiService _detailApiService;

  DetailRepositoryImpl(this._detailApiService);

  @override
  Future<DataState<StatsEntity>> getPokemonStats(int pokemonId) async {
    try {
      final httpResponse = await _detailApiService.getPokemonStats(pokemonId);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final pokemonStats = httpResponse.data;
        return DataSuccess(pokemonStats.toStatsEntity());
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (error) {
      print(error);
      return DataFailed(error);
    }
  }

  // @override
  // Future<DataState<StatsEntity>> getPokemonStats(int pokemonId) async{
  //   return getStateOf<StatsResponse>(request: ()=> _detailApiService.getPokemonStats(pokemonId))
  // }
}
