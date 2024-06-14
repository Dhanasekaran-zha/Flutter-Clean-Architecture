import 'package:flutter_pokedex/src/constants/api_constants.dart';
import 'package:flutter_pokedex/src/pages/home/data/models/responses/pokemon_list_response/pokemon.dart';
import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/src/utils/pokemon_colors.dart';

extension PokemonModelExtension on Pokemon {
  PokemonEntity toPokemonEntity() {
    return PokemonEntity(
      id: this.id,
      name: this.name,
      num: this.num,
      height: this.height,
      weight: this.weight,
      backgroundColor: getPokemonTypeColor(this.type!.first),
      img: ApiUrl().getPokemonImage(this.id!),
      type: this.type,
    );
  }
}
