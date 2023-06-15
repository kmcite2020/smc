import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../domain/patient.dart';
import '../../bloc/patients_bloc.dart';

class CNICView extends ReactiveStatelessWidget {
  const CNICView({
    super.key,
    required this.patient,
  });
  final Patient patient;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "CNIC".textify(),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: TextFormField(
                initialValue: patient.cnic.a,
                onChanged: (value) {
                  patientsBloc.onCnicChanged(value, null, null, patient.mr);
                },
                maxLength: 5,
              ).pad(),
            ),
            Expanded(
              flex: 7,
              child: TextFormField(
                initialValue: patient.cnic.b,
                onChanged: (value) {
                  patientsBloc.onCnicChanged(null, value, null, patient.mr);
                },
                maxLength: 7,
              ).pad(),
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                initialValue: patient.cnic.c,
                onChanged: (value) {
                  patientsBloc.onCnicChanged(null, null, value, patient.mr);
                },
                maxLength: 1,
              ).pad(),
            ),
          ],
        ),
      ],
    );
  }
}
