import 'package:flutter_pokedex/src/base/data_state.dart';
import 'package:flutter_pokedex/src/base/usecase.dart';
import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/src/pages/home/domain/repositories/home_repository.dart';

class HomeUseCase
    implements UseCase<DataState<List<PokemonEntity>>, void> {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  @override
  Future<DataState<List<PokemonEntity>>> call(void params) {
    final response = _homeRepository.getPokemonList.call();
    return response;
  }
}
