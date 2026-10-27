import 'member.dart';

class Book {
  final String id;
  final String title;
  Member? borrower;

  Book({required this.id, required this.title});

  bool get isBorrowed => borrower != null;
}
