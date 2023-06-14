import 'package:flutter/material.dart';

enum Triage {
  green(Colors.green),
  yellow(Colors.yellow),
  red(Colors.red),
  white(Colors.white);

  const Triage(this.color);
  final Color color;
}
