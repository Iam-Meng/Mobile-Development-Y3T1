import '../model/patient.dart';
import '../model/room.dart';

class ClinicService {
  final List<Patient> patients = [];
  final List<Room> rooms = [];

  void addPatient({
    required String patientId,
    required String patientName,
    required Gender gender,
  }) {
    // ! Patient shall not exist already
    if (_findPatientOrNull(patientId) != null) {
      throw Exception('Patient $patientId already exists');
    }
    patients.add(Patient(id: patientId, name: patientName, gender: gender));
  }

  void addRoom({required String roomId, required int capacity}) {
    // ! Room shall not exist already
    if (_findRoomOrNull(roomId) != null) {
      throw Exception('Room $roomId already exists');
    }
    rooms.add(Room(id: roomId, capacity: capacity));
  }

  void assignPatientToRoom(
      {required String patientId, required String roomId}) {
    // ! Patient shall exist
    Patient? patient = _findPatientOrNull(patientId);
    if (patient == null) {
      throw Exception('Patient $patientId not found');
    }

    // ! Room shall exist
    Room? room = _findRoomOrNull(roomId);
    if (room == null) {
      throw Exception('Room $roomId not found');
    }

    // ! Patient shall not be in a room already
    if (_findRoomOfPatientOrNull(patientId) != null) {
      throw Exception('Patient $patientId already has a room');
    }

    // ! Room shall not be full
    if (room.isFull) {
      throw Exception('Room $roomId is full');
    }

    room.patients.add(patient);
  }

  Patient? _findPatientOrNull(String patientId) {
    for (Patient p in patients) {
      if (p.id == patientId) return p;
    }
    return null;
  }

  Room? _findRoomOrNull(String roomId) {
    for (Room r in rooms) {
      if (r.id == roomId) return r;
    }
    return null;
  }

  Room? _findRoomOfPatientOrNull(String patientId) {
    for (Room r in rooms) {
      for (Patient p in r.patients) {
        if (p.id == patientId) return r;
      }
    }
    return null;
  }
}
