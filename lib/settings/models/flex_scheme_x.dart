// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flex_color_scheme/flex_color_scheme.dart';

class FlexSchemeX {
  final FlexScheme flexScheme;
  const FlexSchemeX({
    this.flexScheme = FlexScheme.aquaBlue,
  });

  FlexSchemeX copyWith({
    FlexScheme? flexScheme,
  }) {
    return FlexSchemeX(
      flexScheme: flexScheme ?? this.flexScheme,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'flexScheme': FlexScheme.values.indexOf(flexScheme),
    };
  }

  factory FlexSchemeX.fromMap(Map<String, dynamic> map) {
    return FlexSchemeX(
      flexScheme: FlexScheme.values[map['flexScheme'] ?? 0],
    );
  }

  String toJson() => json.encode(toMap());

  factory FlexSchemeX.fromJson(String source) => FlexSchemeX.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FlexSchemeX(flexScheme: $flexScheme)';

  @override
  bool operator ==(covariant FlexSchemeX other) {
    if (identical(this, other)) return true;

    return other.flexScheme == flexScheme;
  }

  @override
  int get hashCode => flexScheme.hashCode;
}
