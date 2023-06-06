// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'complaint.dart';

class PresentingComplaints {
  final List<Complaint> complaints;
  const PresentingComplaints({
    this.complaints = const [],
  });

  PresentingComplaints copyWith({
    List<Complaint>? complaints,
  }) {
    return PresentingComplaints(
      complaints: complaints ?? this.complaints,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'complaints': complaints.map((x) => x.toMap()).toList(),
    };
  }

  factory PresentingComplaints.fromMap(Map<String, dynamic> map) {
    return PresentingComplaints(
      complaints: List<Complaint>.from(
        (map['complaints']).map<Complaint>(
          (x) => Complaint.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PresentingComplaints.fromJson(String source) => PresentingComplaints.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PresentingComplaints(complaints: $complaints)';

  @override
  bool operator ==(covariant PresentingComplaints other) {
    if (identical(this, other)) return true;

    return listEquals(other.complaints, complaints);
  }

  @override
  int get hashCode => complaints.hashCode;
}
