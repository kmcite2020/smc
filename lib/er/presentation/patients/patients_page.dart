import 'package:flutter/material.dart';
import 'package:smc/core/common.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/er/presentation/arrival_datetime.dart';
import 'package:smc/er/presentation/bloc/patients_bloc.dart';
import 'package:smc/er/presentation/emergency_view/emergency_patients_view.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../domain/patient.dart';

class PatientsPage extends ReactiveStatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonBar(
        children: [
          if (!patientsBloc.isEmpty)
            FloatingActionButton(
              heroTag: randomID,
              onPressed: () {
                RM.navigate.to(
                  const EmergencyPatientsView(),
                );
              },
              child: const Icon(Icons.emergency),
            ),
          FloatingActionButton(
            heroTag: randomID,
            onPressed: () {
              patientsBloc.addPatientForm.submit();
            },
            child: const Icon(Icons.local_hospital),
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'PATIENTS'.textify(),
      ),
      body: ListView.builder(
        itemCount: patientsBloc.patients.length,
        itemBuilder: (context, index) {
          final Patient patient = patientsBloc.patients[index];
          return ListTile(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(child: (patient.age * 100).toInt().textify()),
                    ArrivalDateTimeView(dateTime: patient.arrivalAt),
                    Icon(patient.isAttended ? Icons.done : Icons.close)
                  ],
                ),
                patient.name.textify(),
                patient.mr.textify(textScaleFactor: .9),
              ],
            ),
            tileColor: patient.triage.color.withOpacity(.8),
          );
        },
      ),
    );
  }
}
