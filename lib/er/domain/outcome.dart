// ignore_for_file: public_member_api_docs, sort_constructors_first
class Outcome {
  final OutcomeStatus outcomeStatus;
  final String description;
  Outcome({
    required this.outcomeStatus,
    required this.description,
  });
}

enum OutcomeStatus {
  death,
  referal,
  admission,
  discharged;

  toMap() => index;
  static OutcomeStatus fromMap(map) => OutcomeStatus.values[map];
}
