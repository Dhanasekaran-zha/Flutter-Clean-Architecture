import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> getImagePalette(String url) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(Image.network(url).image);
  return paletteGenerator.dominantColor!.color;
}
