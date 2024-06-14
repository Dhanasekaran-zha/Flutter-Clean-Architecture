abstract class DetailDataEvent {
  const DetailDataEvent();
}

class getPokemonStats extends DetailDataEvent {
  const getPokemonStats(this.pokemonId);
    final int pokemonId;

}
