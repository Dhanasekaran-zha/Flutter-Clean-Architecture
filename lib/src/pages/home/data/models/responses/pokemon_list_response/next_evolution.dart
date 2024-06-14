// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NextEvolution extends Equatable {
  final String? num;
  final String? name;

  NextEvolution(
    this.num,
    this.name,
  );

  NextEvolution copyWith({
    String? num,
    String? name,
  }) {
    return NextEvolution(
      num ?? this.num,
      name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'num': num,
      'name': name,
    };
  }

  factory NextEvolution.fromMap(Map<String, dynamic> map) {
    return NextEvolution(
      map['num'] != null ? map['num'] as String : null,
      map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NextEvolution.fromJson(String source) => NextEvolution.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [num, name];
}
