import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/constants/app_routes.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/screens/detail_screen.dart';
import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokedex/src/pages/home/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouterConfig {
  static GoRouter appRouter = GoRouter(routes: [
    GoRoute(
        name: AppRoutes.HOME_SCREEN,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomeScreen());
        }),
    GoRoute(
        name: AppRoutes.DETAIL_SCREEN,
        path: "/${AppRoutes.DETAIL_SCREEN}",
        pageBuilder: (context, state) {
          final PokemonEntity pokemonData = state.extra as PokemonEntity;
          return MaterialPage(
              child: DetailScreen(
            pokemonData: pokemonData,
          ));
        }),
  ]);

  GoRouter getRouter() {
    return appRouter;
  }
}
