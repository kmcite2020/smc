// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../er/domain/patient.dart';
import '../domain/discharged_patient.dart';
import '../domain/discharged_patients.dart';

final DischargedPatientsBloc dischargedPatientsBloc = DischargedPatientsBloc();

class DischargedPatientsBloc {
  final dischargedPatientsRM = RM.inject(
    () => DischargedPatients(),
  );
  DischargedPatients get x => dischargedPatientsRM.state;
  Map<MR, DischargedPatient> get dischargedPatients => x.dischargedPatients;

  addDischargedPatient(DischargedPatient value) {
    dischargedPatientsRM.setState(
      (s) {
        return s.copyWith(
          dischargedPatients: {...dischargedPatients, value.mr: value},
        );
      },
    );
  }

  removeDischargedPatient(MR mr) {
    dischargedPatientsRM.setState(
      (s) {
        return s.copyWith(
          dischargedPatients: {...dischargedPatients}..remove(mr),
        );
      },
    );
  }
}
