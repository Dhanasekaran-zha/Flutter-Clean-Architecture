// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex/src/pages/detail/domain/entities/stat_item_entity.dart';

class StatsEntity extends Equatable {
  final List<StatItemEntity>? stats;
  StatsEntity({
    this.stats,
  });

  @override
  List<Object?> get props => [stats];
}
