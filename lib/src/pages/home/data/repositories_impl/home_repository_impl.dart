import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/src/base/base_repository.dart';
import 'package:flutter_pokedex/src/base/data_state.dart';
import 'package:flutter_pokedex/src/pages/home/data/mappers/pokemon_list_mapper.dart';
import 'package:flutter_pokedex/src/pages/home/data/services/home_api_service.dart';
import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/src/pages/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends BaseRepository implements HomeRepository {
  final HomeApiService _homeApiService;

  HomeRepositoryImpl(this._homeApiService);

  @override
  Future<DataState<List<PokemonEntity>>> getPokemonList() async {
    
    try {
      final httpResponse = await _homeApiService.getPokemonList();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data.pokemon!.take(20));
        final pokemonList = httpResponse.data.pokemon!
            .map((item) => item.toPokemonEntity())
            .toList();
        return DataSuccess(pokemonList);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (error) {
      print(error.error);
      return DataFailed(error);
    }
  }
}
