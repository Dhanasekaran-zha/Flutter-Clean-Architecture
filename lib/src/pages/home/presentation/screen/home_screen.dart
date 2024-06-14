import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/src/app/injection_container.dart';
import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/src/pages/home/presentation/bloc/remote/home_data_bloc.dart';
import 'package:flutter_pokedex/src/pages/home/presentation/bloc/remote/home_data_event.dart';
import 'package:flutter_pokedex/src/pages/home/presentation/bloc/remote/home_data_state.dart';
import 'package:flutter_pokedex/src/pages/home/presentation/widgets/pokemon_tile.dart';
import 'package:flutter_pokedex/src/widgets/themed_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeDataBloc>(
      create: (context) => sl()..add(const getPokemonData()),
      child: Scaffold(
        appBar: ThemedAppBar("Home", [
          IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.favorite_outline))
        ]),
        body: Center(
          child: _content(),
        ),
      ),
    );
  }
}

_content() {
  return BlocBuilder<HomeDataBloc, HomeDataState>(
    builder: (_, state) {
      if (state is HomeDataStateLoading) {
        return CupertinoActivityIndicator();
      }
      if (state is HomeDataStateDone) {
        return _pokemonList(state.pokemonList!);
      }
      if (state is HomeDataStateError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      return const SizedBox();
    },
  );
}

_pokemonList(List<PokemonEntity> list) {
  return GridView.builder(
      itemCount: list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return PokemonTile(pokemon: list[index]);
      });
}
