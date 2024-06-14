import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/src/base/data_state.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/usecases/detail_usecase.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/bloc/remote/detail_data_event.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/bloc/remote/detail_data_state.dart';

class DetailDataBloc extends Bloc<DetailDataEvent, DetailDataState> {
  final DetailUsecase _detailUsecase;

  DetailDataBloc(this._detailUsecase) : super(const DetailDataStateLoading()) {
    on<getPokemonStats>(onGetPokemonStats);
  }

  void onGetPokemonStats(
      getPokemonStats event, Emitter<DetailDataState> emit) async {
    final dataState = await _detailUsecase.call(event.pokemonId);
    if (dataState is DataSuccess) {
      print("DHANA");
      print(dataState.data!);
      emit(DetailDataStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(DetailDataStateError(dataState.error!));
    }
  }
}
