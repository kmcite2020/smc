import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/core/router.dart';
import 'package:smc/core/ui/back_floating_button.dart';
import 'package:smc/patients/patients_bloc.dart';
import 'package:smc/patients/ui/add_patient_dialog.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/ui/loading_widget.dart';
import '../models/patient_model.dart';
import 'patient_dialog.dart';

class PatientsPage extends ReactiveStatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonBar(
        children: [
          const BackFloatingButton(),
          FloatingActionButton(
            tooltip: 'add patients',
            onPressed: () async {
              patientsBloc.addPatient = await router.toDialog<PatientModel>(
                const AddPatientDialog(),
              );
            },
            child: const Icon(Icons.add_reaction),
          )
        ],
      ),
      appBar: AppBar(
        title: 'Patients'.textify(),
        automaticallyImplyLeading: false,
      ),
      body: patientsBloc.isWaiting ? const LoadingWidget() : const PatientsListWidget(),
    );
  }
}

class PatientsListWidget extends ReactiveStatelessWidget {
  const PatientsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patientsBloc.patients.length,
      itemBuilder: (context, index) {
        final PatientModel patient = patientsBloc.patients[index];
        return ListTile(
          title: patient.name.textify(),
          subtitle: patient.details.textify(),
          leading: CircleAvatar(
            child: patient.age.textify(),
          ),
          trailing: IconButton(
            tooltip: 'modify patients data',
            onPressed: () async {
              currentlySelectedPatientBloc.selectPatient(patient);
              router.toDialog<PatientModel>(
                const PatientDialog(),
              );

              // currentlySelectedPatientBloc.editPatient(tempPatient);
            },
            icon: const Icon(Icons.edit_document),
          ),
        );
      },
    );
  }
}
