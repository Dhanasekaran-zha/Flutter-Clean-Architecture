import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/src/base/data_state.dart';
import 'package:flutter_pokedex/src/pages/home/domain/usecases/home_usecase.dart';
import 'package:flutter_pokedex/src/pages/home/presentation/bloc/remote/home_data_event.dart';
import 'package:flutter_pokedex/src/pages/home/presentation/bloc/remote/home_data_state.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  final HomeUseCase _homeUseCase;

  HomeDataBloc(this._homeUseCase) : super(const HomeDataStateLoading()) {
    on<getPokemonData>(onGetPokemonData);
  }

  void onGetPokemonData(HomeDataEvent event, Emitter<HomeDataState> emit) async {
  final dataState = await _homeUseCase.call({});
  if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(HomeDataStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(HomeDataStateError(dataState.error!));
    }
}

}