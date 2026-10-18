import 'package:my_project/service/lms_service.dart';
import 'package:test/test.dart';

void main() {
  test('creates a student and remove it', () {
    LmsService service = LmsService();

    // Add student
    service.addStudent(studentId: "S1", studentName: "Ronan");
    expect(service.students.first.id, "S1");

    // Remove student
    service.removeStudent(studentId: "S1");
    expect(service.students.isEmpty, true);
  });
}
