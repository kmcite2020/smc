// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../er/domain/patient.dart';
import 'discharged_patient.dart';

class DischargedPatients {
  Map<MR, DischargedPatient> dischargedPatients;
  DischargedPatients({
    this.dischargedPatients = const {},
  });

  DischargedPatients copyWith({
    Map<MR, DischargedPatient>? dischargedPatients,
  }) {
    return DischargedPatients(
      dischargedPatients: dischargedPatients ?? this.dischargedPatients,
    );
  }
}
