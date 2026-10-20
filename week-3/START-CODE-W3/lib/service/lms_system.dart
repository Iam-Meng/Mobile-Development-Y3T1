import '../model/student.dart';
import '../model/course.dart';
import '../model/result.dart';
import '../model/assignment.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<Result> results = [];
  final List<Assignment> assignments = [];

  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    for (Course course in courses) {
      course.studentIds.remove(studentId);
    }
    results.removeWhere((result) => result.studentId == studentId);
    students.remove(student);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  void addCourse({required String courseId, required String courseName}) {
    if (courses.any((course) => course.id == courseId)) {
      throw Exception('Course $courseId already exists!');
    }
    Course newCourse = Course(id: courseId, name: courseName);
    courses.add(newCourse);
    print("Success: Course $courseName with ID $courseId has been added.");
  }

  void removeCourse({required String courseId}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found!');
    }
    if (course.studentIds.isNotEmpty) {
      throw Exception(
          'Cannot remove course $courseId because it has enrolled students.');
    }
    if (course.assignments.isNotEmpty) {
      throw Exception(
          'Cannot remove course $courseId because it has assignments.');
    }
    courses.remove(course);
    print('Success: Course $courseId has been removed.');
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null;
  }

  void enrollStudent({required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);
    if (student == null || course == null) {
      throw Exception('Student or Course not found');
    }
    if (course.studentIds.contains(studentId)) {
      throw Exception(
          'Student $studentId is already enrolled in course $courseId');
    }
    course.studentIds.add(studentId);
    print('Success: Student $studentId has been enrolled in course $courseId.');
  }

  void discardStudentFromCourse(
      {required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);
    if (student == null || course == null) {
      throw Exception('Student or Course not found');
    }
    if (course.studentIds.contains(studentId)) {
      if (results.any((result) =>
          result.studentId == studentId && result.courseId == courseId)) {
        throw Exception(
            'Cannot remove student $studentId from course $courseId because results exist.');
      }
      course.studentIds.remove(studentId);
      print(
          'Success: Student $studentId has been removed from course $courseId.');
    } else {
      throw Exception('Student $studentId is not enrolled in course $courseId');
    }
  }

  void addResult(
      {required String studentId,
      required String courseId,
      required String assignmentId,
      required double score}) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);
    if (student == null || course == null) {
      throw Exception('Student or Course not found');
    }
    if (!course.studentIds.contains(studentId)) {
      throw Exception('Student $studentId is not enrolled in course $courseId');
    }
    if (!course.assignments
        .any((assignment) => assignment.id == assignmentId)) {
      throw Exception(
          'Assignment $assignmentId for course $courseId not found');
    }
    _requirePublishedAssignment(course, assignmentId);
    if (!score.isFinite || score < 0 || score > 100) {
      throw Exception('Score must be between 0 and 100');
    }
    if (results.any((result) =>
        result.studentId == studentId &&
        result.courseId == courseId &&
        result.assignmentId == assignmentId)) {
      throw Exception(
          'Result for student $studentId on assignment $assignmentId in course $courseId already exists');
    }
    results.add(Result(
        studentId: studentId,
        courseId: courseId,
        assignmentId: assignmentId,
        score: score));
    print(
        'Success: Result for student $studentId in course $courseId has been added.');
  }

  void updateResult(
      {required String studentId,
      required String courseId,
      required String assignmentId,
      required double score}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    Assignment assignment = _requirePublishedAssignment(course, assignmentId);
    if (!score.isFinite || score < 0 || score > 100) {
      throw Exception('Score must be between 0 and 100');
    }
    int resultIndex = results.indexWhere((result) =>
        result.studentId == studentId &&
        result.courseId == courseId &&
        result.assignmentId == assignment.id);
    if (resultIndex == -1) {
      throw Exception(
          'Result for student $studentId on assignment $assignmentId in course $courseId not found');
    }
    results[resultIndex] = Result(
        studentId: studentId,
        courseId: courseId,
        assignmentId: assignmentId,
        score: score);
    print(
        'Success: Result for student $studentId on assignment $assignmentId in course $courseId has been updated.');
  }

  void removeResult(
      {required String studentId,
      required String courseId,
      required String assignmentId}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    _requirePublishedAssignment(course, assignmentId);
    Result? result = results.firstWhere(
        (result) =>
            result.studentId == studentId &&
            result.courseId == courseId &&
            result.assignmentId == assignmentId,
        orElse: () => throw Exception(
            'Result for student $studentId on assignment $assignmentId in course $courseId not found'));
    results.remove(result);
    print(
        'Success: Result for student $studentId on assignment $assignmentId in course $courseId has been removed.');
  }

  void addAssignment(
      {required String assignmentId,
      required String courseId,
      required String title}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    if (assignments.any((assignment) =>
        assignment.id == assignmentId && assignment.courseId == courseId)) {
      throw Exception(
          'Assignment $assignmentId for course $courseId already exists');
    }
    Assignment assignment =
        Assignment(id: assignmentId, courseId: courseId, title: title);
    assignments.add(assignment);
    course.assignments.add(assignment);
    print(
        'Success: Assignment $assignmentId for course $courseId has been added.');
  }

  void transitionAssignmentStage(
      {required String assignmentId,
      required String courseId,
      required AssignmentStage stage}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception(
          'Assignment $assignmentId for course $courseId not found');
    }
    Assignment assignment = course.assignments.firstWhere(
        (assignment) => assignment.id == assignmentId,
        orElse: () => throw Exception(
            'Assignment $assignmentId for course $courseId not found'));
    assignment.transitionTo(stage);
    print(
        'Success: Assignment $assignmentId for course $courseId is now $stage.');
  }

  void removeAssignment(
      {required String assignmentId, required String courseId}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception(
          'Assignment $assignmentId for course $courseId not found');
    }
    Assignment? assignment = course.assignments.firstWhere(
        (assignment) => assignment.id == assignmentId,
        orElse: () => throw Exception(
            'Assignment $assignmentId for course $courseId not found'));
    if (results.any((result) =>
        result.assignmentId == assignmentId && result.courseId == courseId)) {
      throw Exception(
          'Cannot remove assignment $assignmentId from course $courseId because results exist.');
    }
    assignments.remove(assignment);
    course.assignments.remove(assignment);
    print(
        'Success: Assignment $assignmentId for course $courseId has been removed.');
  }

  Assignment _requirePublishedAssignment(Course course, String assignmentId) {
    Assignment? assignment;
    for (Assignment courseAssignment in course.assignments) {
      if (courseAssignment.id == assignmentId) {
        assignment = courseAssignment;
        break;
      }
    }
    if (assignment == null) {
      throw Exception(
          'Assignment $assignmentId for course ${course.id} not found');
    }
    if (assignment.stage != AssignmentStage.PUBLISHED) {
      throw StateError(
          'Results can only be changed while assignment $assignmentId is PUBLISHED');
    }
    return assignment;
  }
}
