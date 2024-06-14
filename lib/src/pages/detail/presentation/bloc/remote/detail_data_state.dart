import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/entities/stats_entity.dart';

abstract class DetailDataState extends Equatable {
  final StatsEntity? stats;
  final DioException? error;

  const DetailDataState({this.stats, this.error});

  @override
  List<Object> get props => [stats!, error!];
}

class DetailDataStateLoading extends DetailDataState {
  const DetailDataStateLoading();
}

class DetailDataStateDone extends DetailDataState {
  const DetailDataStateDone(StatsEntity stats) : super(stats: stats);
}

class DetailDataStateError extends DetailDataState {
  const DetailDataStateError(DioException error) : super(error: error);
}
