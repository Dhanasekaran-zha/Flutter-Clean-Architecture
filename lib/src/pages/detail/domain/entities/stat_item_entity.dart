// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class StatItemEntity extends Equatable {
  final String? name;
  final int? stat;

  StatItemEntity({
    this.name,
    this.stat,
  });

  @override
  List<Object?> get props => [
        name,
        stat,
      ];
}
