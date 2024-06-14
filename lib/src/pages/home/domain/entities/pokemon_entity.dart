// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int? id;
  final String? num;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final Color? backgroundColor;
  PokemonEntity({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.backgroundColor,
  });

  @override
  List<Object?> get props {
    return [
      id,
      num,
      name,
      img,
      type,
      height,
      weight,
      backgroundColor,
    ];
  }
}
