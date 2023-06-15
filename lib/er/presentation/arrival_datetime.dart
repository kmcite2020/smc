// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';

class ArrivalDateTimeView extends StatelessWidget {
  const ArrivalDateTimeView({
    Key? key,
    required this.dateTime,
  }) : super(key: key);
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    final year = dateTime.year;
    final month = dateTime.month;
    final day = dateTime.day;
    final minute = dateTime.minute;
    final hour = dateTime.hour;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          '${hour < 10 ? '0$hour' : hour}:${minute < 10 ? '0$minute' : minute}'.textify(textScaleFactor: 1.3),
          '$day/$month/$year'.textify(textScaleFactor: 1),
        ],
      ),
    );
  }
}
