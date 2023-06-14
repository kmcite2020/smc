// ignore_for_file: public_member_api_docs, sort_constructors_first
class CNIC {
  final String a;
  final String b;
  final String c;
  CNIC(
    this.a,
    this.b,
    this.c,
  ) {
    if (a.length != 5 || b.length != 7 || c.length != 1) {
      throw Exception('Not a valid CNIC');
    }
  }
  @override
  String toString() => "$a-$b-$c";
}
