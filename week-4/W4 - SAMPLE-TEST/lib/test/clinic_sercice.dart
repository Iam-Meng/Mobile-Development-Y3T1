import 'package:test/test.dart';

import '../model/patient.dart';
import '../service/clinic_service .dart';

void main() {
  test('assigns a patient to a room', () {
    final clinic = ClinicService();
    clinic.addPatient(
        patientId: 'P1', patientName: 'Dara', gender: Gender.male);
    clinic.addRoom(roomId: 'R1', capacity: 2);

    clinic.assignPatientToRoom(patientId: 'P1', roomId: 'R1');

    expect(clinic.rooms.first.patients.length, 1);
    expect(clinic.rooms.first.patients.first.name, 'Dara');
  });

  test('cannot assign a patient to a full room', () {
    final clinic = ClinicService();
    clinic.addPatient(
        patientId: 'P1', patientName: 'Dara', gender: Gender.male);
    clinic.addPatient(
        patientId: 'P2', patientName: 'Sokha', gender: Gender.female);
    clinic.addRoom(roomId: 'R1', capacity: 1);

    clinic.assignPatientToRoom(patientId: 'P1', roomId: 'R1');

    expect(
      () => clinic.assignPatientToRoom(patientId: 'P2', roomId: 'R1'),
      throwsException,
    );
  });

  test('cannot assign the same patient twice', () {
    final clinic = ClinicService();
    clinic.addPatient(
        patientId: 'P1', patientName: 'Dara', gender: Gender.male);
    clinic.addRoom(roomId: 'R1', capacity: 2);
    clinic.addRoom(roomId: 'R2', capacity: 2);

    clinic.assignPatientToRoom(patientId: 'P1', roomId: 'R1');

    expect(
      () => clinic.assignPatientToRoom(patientId: 'P1', roomId: 'R2'),
      throwsException,
    );
  });

  // TODO Q3: add your 2 tests here
}
