// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smc/er/domain/address.dart';
import 'package:smc/er/domain/classification.dart';
import 'package:smc/er/domain/cnic.dart';
import 'package:smc/er/domain/examinations.dart';
import 'package:smc/er/domain/gender.dart';
import 'package:smc/er/domain/investigations.dart';
import 'package:smc/er/domain/management.dart';
import 'package:smc/er/domain/triage.dart';
import 'package:smc/er/domain/vitals.dart';
import 'package:smc/patients/models/complaint.dart';

typedef MR = String;

class Patient {
  final CNIC cnic;
  final String name;
  final MR mr;
  final Duration age;
  final Gender gender;
  final DateTime arrivalAt;
  final Address address;
  final Classification classification;
  final Triage triage;
  final List<Complaint> presentingComplaints;
  final Vitals vitals;
  final Examinations examinations;
  final List<Investigation> investigations;
  final List<Management> managements;
  final String provisionalDiagnosis;
  final String diagnosis;
  Patient({
    required this.cnic,
    required this.name,
    required this.mr,
    required this.age,
    required this.gender,
    required this.arrivalAt,
    required this.address,
    required this.classification,
    required this.triage,
    required this.presentingComplaints,
    required this.vitals,
    required this.examinations,
    required this.investigations,
    required this.managements,
    required this.provisionalDiagnosis,
    required this.diagnosis,
  });
}
