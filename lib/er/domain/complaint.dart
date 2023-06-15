import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Complaint extends Equatable {
  final String complaint;
  final String history;
  final Duration duration;
  const Complaint({
    required this.complaint,
    required this.history,
    required this.duration,
  });

  Complaint copyWith({
    String? complaint,
    String? history,
    Duration? duration,
  }) {
    return Complaint(
      complaint: complaint ?? this.complaint,
      history: history ?? this.history,
      duration: duration ?? this.duration,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [complaint, history, duration];
}
