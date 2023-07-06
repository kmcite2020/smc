import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Complaint extends Equatable {
  final String id;
  final String complaint;
  final String history;
  final double durationInDays;
  const Complaint({
    required this.id,
    this.complaint = '',
    this.history = '',
    this.durationInDays = 0,
  });

  Complaint copyWith({
    String? id,
    String? complaint,
    String? history,
    double? durationInDays,
  }) {
    return Complaint(
      id: id ?? this.id,
      complaint: complaint ?? this.complaint,
      history: history ?? this.history,
      durationInDays: durationInDays ?? this.durationInDays,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, complaint, history, durationInDays];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'complaint': complaint,
      'history': history,
      'durationInDays': durationInDays,
    };
  }

  factory Complaint.fromMap(Map<String, dynamic> map) {
    return Complaint(
      id: map['id'] as String,
      complaint: map['complaint'] as String,
      history: map['history'] as String,
      durationInDays: map['durationInDays'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Complaint.fromJson(String source) => Complaint.fromMap(json.decode(source) as Map<String, dynamic>);
}
