void main() {
  final students = [
    {"name": "Dara", "Dart": 70, "Flutter": 80, "Database": 60},
    {"name": "Sokha", "Dart": 50, "Flutter": 90, "Database": 70},
    {"name": "Lina", "Dart": 80, "Flutter": 70, "Database": 90},
  ];

  final courses = ["Dart", "Flutter", "Database"];

  // TODO: Implement computeAverage()
  // TODO: For each course:
  // 1. Create a list of scores
  for (final String course in courses) {
    final List<int> scores = [for (final student in students) student[course] as int];
    // 2. Compute the average
    final double average = computeAverage(scores);
    // 3. Display the course name and average
    print('$course: ${average.toStringAsFixed(1)}');
  }
}

double computeAverage(List<int> scores) {
  if (scores.isEmpty) throw ArgumentError('Cannot compute empty scores.');
  int sum = 0;
  int i = 0;
  for (int n in scores) {
    sum += n;
    i++;
  }
  return sum / i;
}
