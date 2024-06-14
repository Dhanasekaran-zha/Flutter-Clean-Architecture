class ApiUrl {
  static const BASE_URL = "https://pokeapi.co/api/v2/";

  static const POKEMON_STAT = "pokemon/{pokemonId}";

  static const POKEMON_LIST =
      "https://1321271030ed4eaaa0894e3978712373.api.mockbin.io/";

  String getPokemonImage(int pokemonId) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonId}.png";
  }
}
