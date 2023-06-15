// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Examinations extends Equatable {
  final String eye;
  final String cvs;
  final String cns;
  final String chest;
  final String skin;
  final String git;
  final String gu;
  const Examinations({
    this.eye = '',
    this.cvs = '',
    this.cns = '',
    this.chest = '',
    this.skin = '',
    this.git = '',
    this.gu = '',
  });

  Examinations copyWith({
    String? eye,
    String? cvs,
    String? cns,
    String? chest,
    String? skin,
    String? git,
    String? gu,
  }) {
    return Examinations(
      eye: eye ?? this.eye,
      cvs: cvs ?? this.cvs,
      cns: cns ?? this.cns,
      chest: chest ?? this.chest,
      skin: skin ?? this.skin,
      git: git ?? this.git,
      gu: gu ?? this.gu,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eye': eye,
      'cvs': cvs,
      'cns': cns,
      'chest': chest,
      'skin': skin,
      'git': git,
      'gu': gu,
    };
  }

  factory Examinations.fromMap(Map<String, dynamic> map) {
    return Examinations(
      eye: map['eye'] as String,
      cvs: map['cvs'] as String,
      cns: map['cns'] as String,
      chest: map['chest'] as String,
      skin: map['skin'] as String,
      git: map['git'] as String,
      gu: map['gu'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Examinations.fromJson(String source) => Examinations.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      eye,
      cvs,
      cns,
      chest,
      skin,
      git,
      gu,
    ];
  }
}
