// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex/src/pages/home/data/models/responses/pokemon_list_response/next_evolution.dart';

class Pokemon extends Equatable {
  final int? id;
  final String? num;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final List<String>? weaknesses;
  final List<NextEvolution>? nextEvolution;

  Pokemon(
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.weaknesses,
    this.nextEvolution,
  );

  Pokemon copyWith({
    int? id,
    String? num,
    String? name,
    String? img,
    List<String>? type,
    String? height,
    String? weight,
    List<String>? weaknesses,
    List<NextEvolution>? nextEvolution,
  }) {
    return Pokemon(
      id ?? this.id,
      num ?? this.num,
      name ?? this.name,
      img ?? this.img,
      type ?? this.type,
      height ?? this.height,
      weight ?? this.weight,
      weaknesses ?? this.weaknesses,
      nextEvolution ?? this.nextEvolution,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'weaknesses': weaknesses,
      'nextEvolution': nextEvolution?.map((x) => x.toMap()).toList(),
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      map['id'] != null ? map['id'] as int : null,
      map['num'] != null ? map['num'] as String : null,
      map['name'] != null ? map['name'] as String : null,
      map['img'] != null ? map['img'] as String : null,
      map['type'] != null
          ? List<String>.from((map['type'] as List<dynamic>))
          : null,
      map['height'] != null ? map['height'] as String : null,
      map['weight'] != null ? map['weight'] as String : null,
      map['weaknesses'] != null
          ? List<String>.from((map['weaknesses'] as List<dynamic>))
          : null,
      map['nextEvolution'] != null
          ? List<NextEvolution>.from(
              (map['nextEvolution'] as List<dynamic>).map<NextEvolution?>(
                (x) => NextEvolution.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

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
      weaknesses,
      nextEvolution,
    ];
  }
}
