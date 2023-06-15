import 'package:flutter/material.dart';

extension TextX on Object? {
  Text textify({double textScaleFactor = 1}) => Text(
        toString(),
        textScaleFactor: textScaleFactor,
      );
}

extension PadX on Widget {
  Widget pad({double padding = 8}) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );
}
