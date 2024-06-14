// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex/src/pages/home/data/models/responses/pokemon_list_response/pokemon.dart';

class PokemonResponse extends Equatable {
  final List<Pokemon>? pokemon;

  PokemonResponse(
    this.pokemon,
  );

  PokemonResponse copyWith({
    List<Pokemon>? pokemon,
  }) {
    return PokemonResponse(
      pokemon ?? this.pokemon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pokemon': pokemon?.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonResponse.fromMap(Map<String, dynamic> map) {
    return PokemonResponse(
      map['pokemon'] != null ? List<Pokemon>.from((map['pokemon'] as List<dynamic>).map<Pokemon?>((x) => Pokemon.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonResponse.fromJson(String source) => PokemonResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [pokemon];
}
