// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Complaint {
  final String complaint;

  Complaint({
    this.complaint = '',
  });

  Complaint copyWith({
    String? complaint,
  }) {
    return Complaint(
      complaint: complaint ?? this.complaint,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'complaint': complaint,
    };
  }

  factory Complaint.fromMap(Map<String, dynamic> map) {
    return Complaint(
      complaint: map['complaint'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Complaint.fromJson(String source) => Complaint.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Complaint(complaint: $complaint)';

  @override
  bool operator ==(covariant Complaint other) {
    if (identical(this, other)) return true;

    return other.complaint == complaint;
  }

  @override
  int get hashCode => complaint.hashCode;
}
