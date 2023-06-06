import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/core/router.dart';
import 'package:smc/core/ui/back_floating_button.dart';
import 'package:smc/patients/models/patient_model.dart';
import 'package:smc/patients/patients_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AddPatientDialog extends ReactiveStatelessWidget {
  const AddPatientDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: ListView(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              patientsBloc.patientId.textify(.9),
              const Align(
                alignment: Alignment.topRight,
                child: BackFloatingButton(),
              ),
            ],
          ).pad,
          'NAME'.textify(),
          TextFormField(
            controller: patientsBloc.patientName.controller,
          ).pad,
          'AGE'.textify(),
          DropdownButtonFormField(
            value: patientsBloc.patientAge.value,
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
          'PRESENTING COMPLAINTS'.textify(),
          TextFormField(),
          'DETAILS'.textify(),
          TextFormField(
            controller: patientsBloc.patientDetails.controller,
            minLines: 2,
            maxLines: 5,
          ).pad,
          ElevatedButton(
            onPressed: (patientsBloc.patientName.value.isEmpty || patientsBloc.patientDetails.value.isEmpty || patientsBloc.patientAge.value.isNaN)
                ? null
                : () {
                    router.back(
                      PatientModel(
                        name: patientsBloc.patientName.value,
                        details: patientsBloc.patientDetails.value,
                        age: patientsBloc.patientAge.value,
                      ),
                    );
                  },
            child: 'Save'.textify(),
          )
        ],
      ).pad,
    );
  }
}
