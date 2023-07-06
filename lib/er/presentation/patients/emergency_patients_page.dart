import 'package:flutter/material.dart';
import 'package:smc/core/common.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/core/router.dart';
import 'package:smc/core/ui/back_floating_button.dart';
import 'package:smc/er/presentation/arrival_datetime.dart';
import 'package:smc/er/presentation/bloc/patients_bloc.dart';
import 'package:smc/er/presentation/emergency_view/emergency_patients_view.dart';
import 'package:smc/patients/discharged/bloc/discharged_patients_bloc.dart';
import 'package:smc/patients/discharged/domain/home_treatment_plan.dart';
import 'package:smc/patients/discharged/domain/medicine.dart';
import 'package:smc/patients/discharged/domain/prescription.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../patients/discharged/domain/discharged_patient.dart';
import '../../domain/patient.dart';

class EmergencyPatientsPage extends ReactiveStatelessWidget {
  const EmergencyPatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonBar(
        children: [
          const BackFloatingButton(),
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
                    CircleAvatar(
                      child: (patient.age * 100).toInt().textify(),
                    ),
                    ArrivalDateTimeView(dateTime: patient.arrivalAt),
                    Icon(patient.isAttended ? Icons.done : Icons.close)
                  ],
                ),
                patient.name.textify(),
                patient.mr.textify(textScaleFactor: .9),
                Row(
                  children: [
                    IconButton(
                      tooltip: 'refer',
                      onPressed: () {},
                      icon: const Icon(Icons.replay_circle_filled_sharp),
                    ),
                    IconButton(
                      tooltip: 'admit',
                      onPressed: () {},
                      icon: const Icon(Icons.admin_panel_settings),
                    ),
                    IconButton(
                      tooltip: 'death',
                      onPressed: () {},
                      icon: const Icon(Icons.dangerous),
                    ),
                    IconButton(
                      tooltip: 'discharge',
                      onPressed: () async {
                        final HomeTreatmentPlan? homeTreatmentPlan = await router.toPageless(
                          PrescriptionCreator(
                            patient: patient,
                          ),
                        );
                        if (homeTreatmentPlan == null) return;
                        patientsBloc.removePatient(patient);
                        dischargedPatientsBloc.addDischargedPatient(
                          DischargedPatient.fromPatient(
                            patient,
                            homeTreatmentPlan,
                          ),
                        );
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                  ],
                ),
              ],
            ),
            tileColor: patient.triage.color.withOpacity(.8),
          );
        },
      ),
    );
  }
}

class PrescriptionCreator extends ReactiveStatelessWidget {
  const PrescriptionCreator({
    super.key,
    required this.patient,
  });
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: prescriptionName.controller,
            decoration: const InputDecoration(
              labelText: 'PRESCRIPTION',
            ),
          ).pad(),
          TextField(
            controller: prescriptionMedicine.controller,
            decoration: const InputDecoration(
              labelText: 'MEDICINE',
            ),
          ).pad(),
          TextField(
            controller: prescriptionDose.controller,
            decoration: const InputDecoration(
              labelText: 'DOSE',
            ),
          ).pad(),
          TextField(
            controller: prescriptionInstruction.controller,
            decoration: const InputDecoration(
              labelText: 'INSTRUCTIONS',
            ),
          ).pad(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _addPrescription(),
                  child: 'ADD PRESCRIPITON'.textify(),
                ).pad(),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    router.back(
                      discharge(patient),
                    );
                  },
                  child: 'SAVE TREATMENT'.textify(),
                ).pad(),
              ),
            ],
          ),
          ..._homeTreatmentPlanRM.state.homeTreatment.values.map(
            (e) {
              return Column(
                children: [
                  e.name.textify(),
                ],
              );
            },
          ),
          _homeTreatmentPlanRM.state.homeTreatment.entries.length.textify(),
        ],
      ),
    );
  }
}

DischargedPatient discharge(Patient patient) {
  return DischargedPatient.fromPatient(
    patient,
    _homeTreatmentPlanRM.state,
  );
}

final prescriptionName = RM.injectTextEditing();
final prescriptionMedicine = RM.injectTextEditing();
final prescriptionDose = RM.injectTextEditing();
final prescriptionInstruction = RM.injectTextEditing();

final _homeTreatmentPlanRM = RM.inject(
  () => const HomeTreatmentPlan(),
);

void _addPrescription() {
  final Prescription prescription = Prescription(
    id: randomID,
    name: prescriptionName.value,
    medicine: Medicine(medicine: prescriptionMedicine.value),
    dose: prescriptionDose.value,
    instructions: prescriptionInstruction.value,
  );
  _homeTreatmentPlanRM.state = _homeTreatmentPlanRM.state.copyWith(
    homeTreatment: {
      ..._homeTreatmentPlanRM.state.homeTreatment,
      prescription.id: prescription,
    },
  );
}
  // final String id;
  // final String name;
  // final Medicine medicine;
  // final String dose;
  // final String instructions;
 