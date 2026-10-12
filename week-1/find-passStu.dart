void main() {
  Map<String, int> scores = {
    "Dara": 78,
    "Sokha": 45,
    "Lina": 62,
    "Vanna": 39,
    "Mony": 85,
  };

  print(getPassedStudents(scores));
}

List<String> getPassedStudents(Map<String, int> scores) {
  List<String> passStu = [];
  for (var entity in scores.entries) {
    if (entity.value >= 50) {
      passStu.add(entity.key);
    }
  }
  return passStu;
}
