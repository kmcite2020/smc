// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';

class DurationView extends StatelessWidget {
  const DurationView({
    Key? key,
    required this.duration,
    this.ageView = AgeView.years,
  }) : super(key: key);
  final Duration duration;
  final AgeView ageView;

  @override
  Widget build(BuildContext context) {
    switch (ageView) {
      case AgeView.days:
        return (duration.inDays).ceil().textify().pad();
      case AgeView.months:
        return (duration.inDays * 30).ceil().textify().pad();
      case AgeView.years:
        return (duration.inDays * 365).ceil().textify().pad();
    }
  }
}

enum AgeView {
  days,
  years,
  months;
}
