import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/router.dart';
import '../../core/ui/back_floating_button.dart';
import '../models/patient_model.dart';
import '../patients_bloc.dart';

class EditPatientDialog extends ReactiveStatelessWidget {
  const EditPatientDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: ListView(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: BackFloatingButton(),
          ).pad,
          'NAME'.textify(),
          TextFormField(
            controller: currentlySelectedPatientBloc.patientName.controller,
          ).pad,
          'AGE'.textify(),
          DropdownButtonFormField(
            value: currentlySelectedPatientBloc.patient.age,
            items: patientsBloc.agesList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: e.textify(),
                  ),
                )
                .toList(),
            onChanged: currentlySelectedPatientBloc.patientAge.onChanged,
          ).pad,
          'DETAILS'.textify(),
          TextFormField(
            controller: currentlySelectedPatientBloc.patientDetails.controller,
            minLines: 2,
            maxLines: 5,
          ).pad,
          ElevatedButton(
            onPressed: (currentlySelectedPatientBloc.patientName.value.isEmpty ||
                    currentlySelectedPatientBloc.patientDetails.value.isEmpty ||
                    currentlySelectedPatientBloc.patientAge.value.isNaN)
                ? null
                : () {
                    router.back(
                      PatientModel(
                        name: currentlySelectedPatientBloc.patientName.value,
                        details: currentlySelectedPatientBloc.patientDetails.value,
                        age: currentlySelectedPatientBloc.patientAge.value,
                      ),
                    );
                  },
            child: 'EDIT'.textify(),
          )
        ],
      ).pad,
    );
  }
}
