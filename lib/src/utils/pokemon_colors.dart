import 'package:flutter/material.dart';


final TypeNormal = Color(0xFFA8A77A);
final TypeFire = Color(0xFFEE8130);
final TypeWater = Color(0xFF6390F0);
final TypeElectric = Color(0xFFF7D02C);
final TypeGrass = Color(0xFF7AC74C);
final TypeIce = Color(0xFF96D9D6);
final TypeFighting = Color(0xFFC22E28);
final TypePoison = Color(0xFFA33EA1);
final TypeGround = Color(0xFFE2BF65);
final TypeFlying = Color(0xFFA98FF3);
final TypePsychic = Color(0xFFF95587);
final TypeBug = Color(0xFFA6B91A);
final TypeRock = Color(0xFFB6A136);
final TypeGhost = Color(0xFF735797);
final TypeDragon = Color(0xFF6F35FC);
final TypeDark = Color(0xFF705746);
final TypeSteel = Color(0xFFB7B7CE);
final TypeFairy = Color(0xFFD685AD);

Color getPokemonTypeColor(String pokemonType) {
  switch (pokemonType.toLowerCase()) {
    case "normal":
      return TypeNormal;
    case "fire":
      return TypeFire;
    case "water":
      return TypeWater;
    case "electric":
      return TypeElectric;
    case "grass":
      return TypeGrass;
    case "ice":
      return TypeIce;
    case "fighting":
      return TypeFighting;
    case "poison":
      return TypePoison;
    case "ground":
      return TypeGround;
    case "flying":
      return TypeFlying;
    case "psychic":
      return TypePsychic;
    case "bug":
      return TypeBug;
    case "rock":
      return TypeRock;
    case "ghost":
      return TypeGhost;
    case "dragon":
      return TypeDragon;
    case "dark":
      return TypeDark;
    case "steel":
      return TypeSteel;
    case "fairy":
      return TypeFairy;
    default:
      return Colors.grey;
  }
}
