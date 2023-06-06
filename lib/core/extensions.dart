import 'package:flutter/material.dart';

extension TextX on Object? {
  Text textify([double textScaleFactor = 1]) => Text(
        toString(),
        textScaleFactor: textScaleFactor,
      );
}

extension PadX on Widget {
  Widget get pad => Padding(
        padding: const EdgeInsets.all(8),
        child: this,
      );
}
