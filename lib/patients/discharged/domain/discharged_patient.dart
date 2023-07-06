// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:smc/er/domain/address.dart';
import 'package:smc/er/domain/classification.dart';
import 'package:smc/er/domain/cnic.dart';
import 'package:smc/er/domain/complaint.dart';
import 'package:smc/er/domain/examinations.dart';
import 'package:smc/er/domain/gender.dart';
import 'package:smc/er/domain/investigation.dart';
import 'package:smc/er/domain/management.dart';
import 'package:smc/er/domain/patient.dart';
import 'package:smc/er/domain/triage.dart';
import 'package:smc/er/domain/vitals.dart';
import 'package:smc/patients/discharged/domain/home_treatment_plan.dart';

class DischargedPatient extends Patient {
  final HomeTreatmentPlan homeTreatmentPlan;
  const DischargedPatient({
    this.homeTreatmentPlan = const HomeTreatmentPlan(),
    CNIC cnic = const CNIC(),
    String name = '',
    required MR mr,
    double age = 0,
    Gender gender = Gender.male,
    bool isAttended = false,
    required DateTime arrivalAt,
    Address address = const Address(),
    Classification classification = Classification.medical,
    Triage triage = Triage.green,
    Map<String, Complaint> presentingComplaints = const {},
    Map<DateTime, Vitals> vitals = const {},
    Examinations examinations = const Examinations(),
    Map<DateTime, Investigation> investigations = const {},
    Map<DateTime, Management> managements = const {},
    String provisionalDiagnosis = '',
    String diagnosis = '',
  }) : super(
          cnic: cnic,
          name: name,
          mr: mr,
          age: age,
          gender: gender,
          isAttended: isAttended,
          arrivalAt: arrivalAt,
          address: address,
          classification: classification,
          triage: triage,
          presentingComplaints: presentingComplaints,
          vitals: vitals,
          examinations: examinations,
          investigations: investigations,
          managements: managements,
          provisionalDiagnosis: provisionalDiagnosis,
          diagnosis: diagnosis,
        );
  @override
  Patient copyWith({
    HomeTreatmentPlan? homeTreatmentPlan,
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
  }) =>
      DischargedPatient(
        homeTreatmentPlan: homeTreatmentPlan ?? this.homeTreatmentPlan,
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
  static DischargedPatient fromPatient(
    Patient patient,
    HomeTreatmentPlan homeTreatmentPlan,
  ) =>
      DischargedPatient(
        homeTreatmentPlan: homeTreatmentPlan,
        cnic: patient.cnic,
        name: patient.name,
        mr: patient.mr,
        age: patient.age,
        gender: patient.gender,
        isAttended: patient.isAttended,
        arrivalAt: patient.arrivalAt,
        address: patient.address,
        classification: patient.classification,
        triage: patient.triage,
        presentingComplaints: patient.presentingComplaints,
        vitals: patient.vitals,
        examinations: patient.examinations,
        investigations: patient.investigations,
        managements: patient.managements,
        provisionalDiagnosis: patient.provisionalDiagnosis,
        diagnosis: patient.diagnosis,
      );
}
