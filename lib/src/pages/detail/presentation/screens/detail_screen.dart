import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/src/app/injection_container.dart';
import 'package:flutter_pokedex/src/constants/app_fonts.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/entities/stat_item_entity.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/bloc/remote/detail_data_bloc.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/bloc/remote/detail_data_event.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/bloc/remote/detail_data_state.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/widgets/detail_img_bg_clipper.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/widgets/height_weight_view.dart';
import 'package:flutter_pokedex/src/pages/detail/presentation/widgets/skill_container.dart';
import 'package:flutter_pokedex/src/pages/home/domain/entities/pokemon_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailScreen extends StatefulWidget {
  final PokemonEntity pokemonData;

  const DetailScreen({super.key, required this.pokemonData});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double? screenWidth;
  double? screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider<DetailDataBloc>(
      create: (context) => sl()..add(getPokemonStats(widget.pokemonData.id!)),
      child: SafeArea(
        child: Scaffold(
          body: _content(),
        ),
      ),
    );
  }

  _content() {
    return BlocBuilder<DetailDataBloc, DetailDataState>(
      builder: (_, state) {
        if (state is DetailDataStateLoading) {
          return Center(child: CupertinoActivityIndicator());
        }
        if (state is DetailDataStateDone) {
          print(state.stats?.stats);
          return SizedBox(
            height: screenHeight,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _imageContainer(),
                  _detailedContainer(state.stats!.stats!),
                ],
              ),
            ),
          );
        }
        if (state is DetailDataStateError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        return const SizedBox();
      },
    );
  }

  _detailedContainer(List<StatItemEntity> stats) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeightWeightView(
                title: "Height", value: widget.pokemonData.height!),
            HeightWeightView(title: "Weight", value: widget.pokemonData.weight!)
          ],
        ),
        SizedBox(
          height: 25,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: stats.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SkillContainer(
                title: stats[index].name!, value: stats[index].stat!);
          },
        ),
      ],
    );
  }

  _imageContainer() {
    return Stack(
      children: [
        ClipPath(
          clipper: DetailImageBackGroundClipper(),
          child: Container(
            height: screenHeight! / 2,
            width: screenWidth,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, 0),
                radius: 0.7,
                colors: <Color>[
                  Colors.white,
                  widget.pokemonData.backgroundColor!,
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            _appBarContainer(),
            Container(
              height: screenHeight! / 3,
              width: screenWidth,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.pokemonData.img!,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 35),
              decoration: BoxDecoration(
                  color: widget.pokemonData.backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                widget.pokemonData.type!.first,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppFontFamily.MONTSERRAT,
                    fontSize: AppFontSize.XXXL,
                    fontWeight: AppFontWeight.SEMI_BOLD),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _appBarContainer() {
    return Container(
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          Text(
            widget.pokemonData.name!,
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFontFamily.MONTSERRAT,
                fontSize: AppFontSize.XXXL,
                fontWeight: AppFontWeight.BOLD),
          ),
          IconButton(
            icon: Icon(Icons.favorite_outline),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
