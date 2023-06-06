import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/core/router.dart';
import 'package:smc/patients/patients_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PatientDialog extends ReactiveStatelessWidget {
  const PatientDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: ListView(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                label: 'Edit Patient'.textify(),
                onPressed: null,
                icon: const Icon(Icons.edit_document),
              ),
            ],
          ).pad,
          'NAME'.textify(),
          TextFormField(
            // controller: patientsBloc.patientName.controller,
            initialValue: currentlySelectedPatientBloc.patient.name,
          ).pad,
          'AGE'.textify(),
          DropdownButtonFormField(
            value: currentlySelectedPatientBloc.patientAge.value,
            items: patientsBloc.agesList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: e.textify(),
                  ),
                )
                .toList(),
            onChanged: patientsBloc.patientAge.onChanged,
          ).pad,
          'DETAILS'.textify(),
          TextFormField(
            // // controller: patientsBloc.patientDetails.controller,
            initialValue: currentlySelectedPatientBloc.patient.details,
            minLines: 2,
            maxLines: 5,
          ).pad,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    router.back();
                  },
                  child: 'Cancel'.textify(),
                ).pad,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: patientsBloc.isPatientPresent(currentlySelectedPatientBloc.patient)
                      ? null
                      : () {
                          // final x = PatientModel(
                          //   name: patientsBloc.patientName.value,
                          //   details: patientsBloc.patientDetails.value,
                          //   age: patientsBloc.patientAge.value,
                          // );
                        },
                  child: 'Save'.textify(),
                ).pad,
              ),
            ],
          )
        ],
      ).pad,
    );
  }
}
