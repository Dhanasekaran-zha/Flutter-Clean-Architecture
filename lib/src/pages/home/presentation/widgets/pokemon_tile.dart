import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/constants/app_fonts.dart';
import 'package:flutter_pokedex/src/constants/app_routes.dart';
import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

class PokemonTile extends StatefulWidget {
  final PokemonEntity pokemon;

  const PokemonTile({super.key, required this.pokemon});

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(
        AppRoutes.DETAIL_SCREEN,
        extra: widget.pokemon,
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: RadialGradient(
            center: Alignment(0, 0),
            radius: 0.7,
            colors: <Color>[
              Colors.white,
              widget.pokemon.backgroundColor!,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.pokemon.img!,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${widget.pokemon.num}",
                    style: TextStyle(
                      fontSize: AppFontSize.M,
                      fontWeight: AppFontWeight.SEMI_BOLD,
                    ),
                  ),
                  Text(
                    widget.pokemon.name!,
                    style: TextStyle(
                      fontSize: AppFontSize.M,
                      fontWeight: AppFontWeight.SEMI_BOLD,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
