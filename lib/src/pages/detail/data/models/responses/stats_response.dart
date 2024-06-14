import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pokedex/src/pages/detail/data/models/responses/stats_response_item.dart';

class StatsResponse extends Equatable {
  final List<StatsResponseItem>? stats;
  StatsResponse({
    this.stats,
  });

  StatsResponse copyWith({
    List<StatsResponseItem>? stats,
  }) {
    return StatsResponse(
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stats': stats?.map((x) => x.toMap()).toList(),
    };
  }

  factory StatsResponse.fromMap(Map<String, dynamic> map) {
    return StatsResponse(
      stats: map['stats'] != null ? List<StatsResponseItem>.from((map['stats'] as List<dynamic>).map<StatsResponseItem?>((x) => StatsResponseItem.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatsResponse.fromJson(String source) => StatsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StatsResponse(stats: $stats)';

  @override
  bool operator ==(covariant StatsResponse other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.stats, stats);
  }

  @override
  int get hashCode => stats.hashCode;

  @override
  List<Object?> get props => [stats];
}
