// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class StatsResponseItem extends Equatable {
  final int? base_stat;
  final Stat? stat;
  StatsResponseItem({
    this.base_stat,
    this.stat,
  });

  StatsResponseItem copyWith({
    int? base_stat,
    Stat? stat,
  }) {
    return StatsResponseItem(
      base_stat: base_stat ?? this.base_stat,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'base_stat': base_stat,
      'stat': stat?.toMap(),
    };
  }

  factory StatsResponseItem.fromMap(Map<String, dynamic> map) {
    return StatsResponseItem(
      base_stat: map['base_stat'] != null ? map['base_stat'] as int : null,
      stat: map['stat'] != null
          ? Stat.fromMap(map['stat'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatsResponseItem.fromJson(String source) =>
      StatsResponseItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StatsResponseItem(base_stat: $base_stat, stat: $stat)';

  @override
  bool operator ==(covariant StatsResponseItem other) {
    if (identical(this, other)) return true;

    return other.base_stat == base_stat && other.stat == stat;
  }

  @override
  int get hashCode => base_stat.hashCode ^ stat.hashCode;

  @override
  List<Object?> get props => [base_stat, stat];
}

class Stat extends Equatable {
  final String? name;
  Stat({
    this.name,
  });

  Stat copyWith({
    String? name,
  }) {
    return Stat(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Stat.fromMap(Map<String, dynamic> map) {
    return Stat(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stat.fromJson(String source) =>
      Stat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Stat(name: $name)';

  @override
  bool operator ==(covariant Stat other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  List<Object?> get props => [name];
}
