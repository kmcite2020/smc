// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/core/router.dart';
import 'package:smc/er/domain/complaint.dart';
import 'package:smc/er/domain/patient.dart';

class ComplaintsView extends StatelessWidget {
  const ComplaintsView({
    Key? key,
    required this.patient,
  }) : super(key: key);
  final Patient patient;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: patient.presentingComplaints.values.map(
            (Complaint e) {
              return Row(
                children: [
                  Column(
                    children: [
                      e.complaint.textify().pad(),
                      e.history.textify().pad(),
                    ],
                  ),
                  e.durationInDays.toInt().textify()
                  // DurationView(duration: e.duration),
                ],
              );
            },
          ).toList(),
        ),
        ElevatedButton(
          onPressed: () {
            router.toDialog(
              Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: patient.presentingComplaints.values.map(
                    (Complaint e) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              e.complaint.textify().pad(),
                              e.history.textify().pad(),
                            ],
                          ),
                          e.durationInDays.toInt().textify()
                          // DurationView(duration: e.duration),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          },
          child: "EDIT COMPLAINTS".textify(),
        ),
        const TextField().pad(),
      ],
    );
  }
}
