// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:smc/settings/models/flex_scheme_x.dart';

class SettingsState {
  final bool isDark;
  final FlexSchemeX flexSchemeX;
  final double borderRadius;
  SettingsState({
    this.isDark = false,
    this.flexSchemeX = const FlexSchemeX(),
    this.borderRadius = 4,
  });

  SettingsState copyWith({
    bool? isDark,
    FlexSchemeX? flexSchemeX,
    double? borderRadius,
  }) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
      flexSchemeX: flexSchemeX ?? this.flexSchemeX,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isDark': isDark,
      'flexSchemeX': flexSchemeX.toMap(),
      'borderRadius': borderRadius,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      isDark: map['isDark'] as bool,
      flexSchemeX: FlexSchemeX.fromMap(map['flexSchemeX'] as Map<String, dynamic>),
      borderRadius: map['borderRadius'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsState.fromJson(String source) => SettingsState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SettingsState(isDark: $isDark, flexSchemeX: $flexSchemeX, borderRadius: $borderRadius)';

  @override
  bool operator ==(covariant SettingsState other) {
    if (identical(this, other)) return true;

    return other.isDark == isDark && other.flexSchemeX == flexSchemeX && other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => isDark.hashCode ^ flexSchemeX.hashCode ^ borderRadius.hashCode;
}
