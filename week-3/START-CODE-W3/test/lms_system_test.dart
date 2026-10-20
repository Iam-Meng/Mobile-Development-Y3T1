import 'package:test/test.dart';
import '../lib/model/assignment.dart';
import '../lib/service/lms_system.dart';

void publishAssignment(LmsSystem lms, String assignmentId, String courseId) {
  lms.transitionAssignmentStage(
    assignmentId: assignmentId,
    courseId: courseId,
    stage: AssignmentStage.PUBLISHED,
  );
}

void main() {
  group('Task 1: Course Management', () {
    test('add and remove a course successfully', () {
      final lms = LmsSystem();

      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      expect(lms.courses.length, 1);
      expect(lms.courses.first.name, 'Mobile Development');

      lms.removeCourse(courseId: 'C1');
      expect(lms.courses.length, 0);
    });

    test('reject duplicate course ID', () {
      final lms = LmsSystem();
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

      expect(
        () => lms.addCourse(courseId: 'C1', courseName: 'Advanced Mobile'),
        throwsException,
      );
    });

    test('reject removal of a nonexistent course', () {
      final lms = LmsSystem();

      expect(
        () => lms.removeCourse(courseId: 'C999'),
        throwsException,
      );
    });
  });

  group('Task 2: Student Enrollment', () {
    test('enroll an existing student in an existing course', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

      lms.enrollStudent(studentId: 'S1', courseId: 'C1');

      // Verify enrollment is recorded
      final course = lms.courses.firstWhere((c) => c.id == 'C1');
      expect(course.studentIds, contains('S1'));
    });

    test('reject enrollment if student or course does not exist', () {
      final lms = LmsSystem();
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

      // Student does not exist
      expect(
        () => lms.enrollStudent(studentId: 'S99', courseId: 'C1'),
        throwsException,
      );

      // Course does not exist
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      expect(
        () => lms.enrollStudent(studentId: 'S1', courseId: 'C99'),
        throwsException,
      );
    });

    test('reject duplicate enrollment', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

      lms.enrollStudent(studentId: 'S1', courseId: 'C1');

      // Try enrolling again
      expect(
        () => lms.enrollStudent(studentId: 'S1', courseId: 'C1'),
        throwsException,
      );
    });
  });

  group('Task 3: Removing Enrollments & Global Student Deletion', () {
    test('discard student from a specific course', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');

      lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');

      final course = lms.courses.first;
      expect(course.studentIds, isEmpty);
    });

    test('global student removal clears enrollments and results', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C1', title: 'Assignment 1');
      publishAssignment(lms, 'A1', 'C1');
      lms.addResult(
          studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85);

      // Remove student globally
      lms.removeStudent(studentId: 'S1');

      // Verify student is gone
      expect(lms.students, isEmpty);
      // Verify enrollment is cleared from course
      expect(lms.courses.first.studentIds, isEmpty);
      // Verify results belonging to S1 are removed
      expect(lms.results, isEmpty);
    });
  });

  group('Task 4 & 5: Results Management', () {
    test(
        'add a valid result and reject invalid scores or non-enrolled students',
        () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C1', title: 'Assignment 1');
      publishAssignment(lms, 'A1', 'C1');

      // Reject because not enrolled yet
      expect(
        () => lms.addResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85),
        throwsException,
      );

      // Enroll student
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');

      // Reject invalid score (> 100)
      expect(
        () => lms.addResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 105),
        throwsException,
      );

      // Add valid result
      lms.addResult(
          studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85);
      expect(lms.results.length, 1);
      expect(lms.results.first.score, 85);

      // Reject duplicate result for the same student and assignment
      expect(
        () => lms.addResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 90),
        throwsException,
      );
    });

    test('results are unique per assignment, not per course', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C1', title: 'Assignment 1');
      lms.addAssignment(
          assignmentId: 'A2', courseId: 'C1', title: 'Assignment 2');
      publishAssignment(lms, 'A1', 'C1');
      publishAssignment(lms, 'A2', 'C1');

      lms.addResult(
          studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85);
      lms.addResult(
          studentId: 'S1', courseId: 'C1', assignmentId: 'A2', score: 90);

      expect(lms.results, hasLength(2));
    });

    test(
        'reject a result for an assignment in another course or nonexistent assignment',
        () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.addCourse(courseId: 'C2', courseName: 'Web Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C2', title: 'Assignment 1');

      expect(
        () => lms.addResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85),
        throwsException,
      );
      expect(
        () => lms.addResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A99', score: 85),
        throwsException,
      );
    });
  });

  group('Task 6: Assignment Management', () {
    test(
        'an assignment belongs to its course and duplicate IDs are course-scoped',
        () {
      final lms = LmsSystem();
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.addCourse(courseId: 'C2', courseName: 'Web Development');

      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C1', title: 'Assignment 1');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C2', title: 'Assignment 1');

      expect(lms.assignments, hasLength(2));
      expect(lms.courses.first.assignments.single.courseId, 'C1');
      expect(lms.courses.last.assignments.single.courseId, 'C2');
      expect(
        () => lms.addAssignment(
            assignmentId: 'A1', courseId: 'C1', title: 'Duplicate'),
        throwsException,
      );
      expect(
        () => lms.addAssignment(
            assignmentId: 'A2', courseId: 'C999', title: 'Unknown course'),
        throwsException,
      );
    });

    test('assignment and course removal preserve results and relationships',
        () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C1', title: 'Assignment 1');
      publishAssignment(lms, 'A1', 'C1');
      lms.addResult(
          studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85);

      expect(
        () => lms.removeAssignment(assignmentId: 'A1', courseId: 'C1'),
        throwsException,
      );
      expect(
        () => lms.removeCourse(courseId: 'C1'),
        throwsException,
      );

      lms.removeResult(studentId: 'S1', courseId: 'C1', assignmentId: 'A1');
      lms.removeAssignment(assignmentId: 'A1', courseId: 'C1');

      expect(lms.assignments, isEmpty);
      expect(lms.courses.first.assignments, isEmpty);
      expect(
        () => lms.removeCourse(courseId: 'C1'),
        throwsException,
      );

      lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');
      lms.removeCourse(courseId: 'C1');
      expect(lms.courses, isEmpty);
    });

    test('cannot discard a student while course results exist', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C1', title: 'Assignment 1');
      publishAssignment(lms, 'A1', 'C1');
      lms.addResult(
          studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85);

      expect(
        () => lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1'),
        throwsException,
      );
    });
  });

  group('Bonus B: Assignment Stages', () {
    test('assignments transition only from DRAFT to PUBLISHED to CLOSED', () {
      final lms = LmsSystem();
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C1', title: 'Assignment 1');

      final assignment = lms.assignments.single;
      expect(assignment.stage, AssignmentStage.DRAFT);
      expect(
        () => lms.transitionAssignmentStage(
            assignmentId: 'A1', courseId: 'C1', stage: AssignmentStage.CLOSED),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.transitionAssignmentStage(
            assignmentId: 'A1', courseId: 'C1', stage: AssignmentStage.DRAFT),
        throwsA(isA<StateError>()),
      );

      lms.transitionAssignmentStage(
          assignmentId: 'A1', courseId: 'C1', stage: AssignmentStage.PUBLISHED);
      expect(assignment.stage, AssignmentStage.PUBLISHED);
      expect(
        () => lms.transitionAssignmentStage(
            assignmentId: 'A1',
            courseId: 'C1',
            stage: AssignmentStage.PUBLISHED),
        throwsA(isA<StateError>()),
      );

      lms.transitionAssignmentStage(
          assignmentId: 'A1', courseId: 'C1', stage: AssignmentStage.CLOSED);
      expect(assignment.stage, AssignmentStage.CLOSED);
      expect(
        () => lms.transitionAssignmentStage(
            assignmentId: 'A1',
            courseId: 'C1',
            stage: AssignmentStage.PUBLISHED),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.transitionAssignmentStage(
            assignmentId: 'A99',
            courseId: 'C1',
            stage: AssignmentStage.PUBLISHED),
        throwsException,
      );
    });

    test('results can be added, updated, and removed only while PUBLISHED', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Ronan');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.addAssignment(
          assignmentId: 'A1', courseId: 'C1', title: 'Assignment 1');
      expect(
        () => lms.addResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.updateResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85),
        throwsA(isA<StateError>()),
      );

      publishAssignment(lms, 'A1', 'C1');
      lms.addResult(
          studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 85);
      lms.updateResult(
          studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 92);
      expect(lms.results.single.score, 92);
      expect(
        () => lms.updateResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 101),
        throwsException,
      );
      expect(
        () => lms.updateResult(
            studentId: 'S1',
            courseId: 'C1',
            assignmentId: 'A1',
            score: double.nan),
        throwsException,
      );
      expect(lms.results.single.score, 92);

      lms.transitionAssignmentStage(
          assignmentId: 'A1', courseId: 'C1', stage: AssignmentStage.CLOSED);
      expect(
        () => lms.addResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 90),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.updateResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1', score: 90),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.removeResult(
            studentId: 'S1', courseId: 'C1', assignmentId: 'A1'),
        throwsA(isA<StateError>()),
      );
      expect(lms.results.single.score, 92);
    });
  });
}
