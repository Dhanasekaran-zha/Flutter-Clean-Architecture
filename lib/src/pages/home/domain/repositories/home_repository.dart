import 'package:flutter_pokedex/src/base/data_state.dart';
import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';

abstract class HomeRepository {
  Future<DataState<List<PokemonEntity>>> getPokemonList();
}
