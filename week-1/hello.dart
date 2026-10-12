void main() {
  printStu('ronan', scores: [100, 67, 89]);
}

void printStu(
  String name, {
  int age = 20,
  String? address,
  List<int> scores = const [],
}) {
  print('Student name\t: $name');
  print('Age\t\t: $age');
  if (address != null) {
    print('Address\t\t: $address');
  } else {
    print('Address\t\t: No address');
  }
  String scoreText = "Scores\t\t:";
  for (int score in scores) {
    scoreText += " $score";
  }
  print(scoreText);
}
