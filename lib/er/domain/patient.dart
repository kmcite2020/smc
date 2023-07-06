// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:smc/er/domain/address.dart';
import 'package:smc/er/domain/classification.dart';
import 'package:smc/er/domain/cnic.dart';
import 'package:smc/er/domain/examinations.dart';
import 'package:smc/er/domain/gender.dart';
import 'package:smc/er/domain/investigation.dart';
import 'package:smc/er/domain/management.dart';
import 'package:smc/er/domain/triage.dart';
import 'package:smc/er/domain/vitals.dart';

import 'complaint.dart';

typedef MR = String;

class Patient extends Equatable {
  final CNIC cnic; // done
  final String name; // done
  final MR mr; //
  final double age; //
  final Gender gender; //
  final bool isAttended; //
  final DateTime arrivalAt; //
  final Address address;
  final Classification classification; //
  final Triage triage; //
  final Map<String, Complaint> presentingComplaints;
  final Map<DateTime, Vitals> vitals;
  final Examinations examinations;
  final Map<DateTime, Investigation> investigations; //
  final Map<DateTime, Management> managements; //
  final String provisionalDiagnosis; //
  final String diagnosis; //
  const Patient({
    this.cnic = const CNIC(),
    this.name = '',
    required this.mr,
    this.age = 0,
    this.gender = Gender.male,
    this.isAttended = false,
    required this.arrivalAt,
    this.address = const Address(),
    this.classification = Classification.medical,
    this.triage = Triage.green,
    this.presentingComplaints = const {},
    this.vitals = const {},
    this.examinations = const Examinations(),
    this.investigations = const {},
    this.managements = const {},
    this.provisionalDiagnosis = '',
    this.diagnosis = '',
  });

  Patient copyWith({
    CNIC? cnic,
    String? name,
    MR? mr,
    double? age,
    Gender? gender,
    bool? isAttended,
    DateTime? arrivalAt,
    Address? address,
    Classification? classification,
    Triage? triage,
    Map<String, Complaint>? presentingComplaints,
    Map<DateTime, Vitals>? vitals,
    Examinations? examinations,
    Map<DateTime, Investigation>? investigations,
    Map<DateTime, Management>? managements,
    String? provisionalDiagnosis,
    String? diagnosis,
  }) {
    return Patient(
      cnic: cnic ?? this.cnic,
      name: name ?? this.name,
      mr: mr ?? this.mr,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      isAttended: isAttended ?? this.isAttended,
      arrivalAt: arrivalAt ?? this.arrivalAt,
      address: address ?? this.address,
      classification: classification ?? this.classification,
      triage: triage ?? this.triage,
      presentingComplaints: presentingComplaints ?? this.presentingComplaints,
      vitals: vitals ?? this.vitals,
      examinations: examinations ?? this.examinations,
      investigations: investigations ?? this.investigations,
      managements: managements ?? this.managements,
      provisionalDiagnosis: provisionalDiagnosis ?? this.provisionalDiagnosis,
      diagnosis: diagnosis ?? this.diagnosis,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      cnic,
      name,
      mr,
      age,
      gender,
      isAttended,
      arrivalAt,
      address,
      classification,
      triage,
      presentingComplaints,
      vitals,
      examinations,
      investigations,
      managements,
      provisionalDiagnosis,
      diagnosis,
    ];
  }
}
