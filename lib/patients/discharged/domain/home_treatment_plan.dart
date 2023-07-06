// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:smc/patients/discharged/domain/prescription.dart';

class HomeTreatmentPlan extends Equatable {
  final Map<String, Prescription> homeTreatment;
  const HomeTreatmentPlan({
    this.homeTreatment = const {},
  });

  HomeTreatmentPlan copyWith({
    Map<String, Prescription>? homeTreatment,
  }) {
    return HomeTreatmentPlan(
      homeTreatment: homeTreatment ?? this.homeTreatment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'homeTreatment': homeTreatment,
    };
  }

  factory HomeTreatmentPlan.fromMap(Map<String, dynamic> map) {
    return HomeTreatmentPlan(
      homeTreatment: Map<String, Prescription>.from((map['homeTreatment'] as Map<String, Prescription>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeTreatmentPlan.fromJson(String source) => HomeTreatmentPlan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [homeTreatment];
}
