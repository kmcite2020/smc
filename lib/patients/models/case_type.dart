// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum CaseType {
  surgical,
  medical,
  peds,
  gyne,
  misc;

  int toMap() => index;

  static CaseType fromMap(int map) {
    return CaseType.values[map];
  }
}

enum CaseStatus {
  ward,
  opd,
  discharged,
  misc;

  int toMap() => index;

  static CaseStatus fromMap(int map) {
    return CaseStatus.values[map];
  }
}

class CaseX {
  final CaseType caseType;
  final CaseStatus caseStatus;

  const CaseX({
    this.caseType = CaseType.medical,
    this.caseStatus = CaseStatus.opd,
  });

  CaseX copyWith({
    CaseType? caseType,
    CaseStatus? caseStatus,
  }) {
    return CaseX(
      caseType: caseType ?? this.caseType,
      caseStatus: caseStatus ?? this.caseStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'caseType': caseType.toMap(),
      'caseStatus': caseStatus.toMap(),
    };
  }

  factory CaseX.fromMap(Map<String, dynamic> map) {
    return CaseX(
      caseType: CaseType.fromMap(map['caseType']),
      caseStatus: CaseStatus.fromMap(map['caseStatus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CaseX.fromJson(String source) => CaseX.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CaseTypeX(caseType: $caseType, caseStatus: $caseStatus)';

  @override
  bool operator ==(covariant CaseX other) {
    if (identical(this, other)) return true;

    return other.caseType == caseType && other.caseStatus == caseStatus;
  }

  @override
  int get hashCode => caseType.hashCode ^ caseStatus.hashCode;
}
