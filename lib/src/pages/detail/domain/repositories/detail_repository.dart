import 'package:flutter_pokedex/src/base/data_state.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/entities/stats_entity.dart';

abstract class DetailRepository {
  Future<DataState<StatsEntity>> getPokemonStats(int pokemonId);
}
