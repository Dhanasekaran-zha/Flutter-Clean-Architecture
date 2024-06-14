import 'package:flutter_pokedex/src/base/data_state.dart';
import 'package:flutter_pokedex/src/base/usecase.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/entities/stats_entity.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/repositories/detail_repository.dart';

class DetailUsecase implements UseCase<DataState<StatsEntity>, int> {
  final DetailRepository _detailRepository;

  DetailUsecase(this._detailRepository);

  @override
  Future<DataState<StatsEntity>> call(int? params) {
    return _detailRepository.getPokemonStats(params!);
  }
}
