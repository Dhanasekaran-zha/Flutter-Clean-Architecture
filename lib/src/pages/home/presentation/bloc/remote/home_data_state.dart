// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';

abstract class HomeDataState extends Equatable {
  final List<PokemonEntity>? pokemonList;
  final DioException? error;

  const HomeDataState({this.pokemonList, this.error});

  @override
  List<Object> get props => [pokemonList!, error!];
}

class HomeDataStateLoading extends HomeDataState {
  const HomeDataStateLoading();
}

class HomeDataStateDone extends HomeDataState {
  const HomeDataStateDone(List<PokemonEntity> list) : super(pokemonList: list);
}

class HomeDataStateError extends HomeDataState {
  const HomeDataStateError(DioException error) : super(error: error);
}
