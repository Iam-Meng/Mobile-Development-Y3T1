import 'patient.dart';

class Room {
  final String id;
  final int capacity;
  final List<Patient> patients = [];

  Room({required this.id, required this.capacity});

  bool get isFull => patients.length >= capacity;
}
