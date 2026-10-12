void main() {
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];

  // method 1 - for loop
  List<int> passStu = [];
  for (int score in scores) {
    if (score >= 50) {
      passStu.add(score);
    }
  }

  // method 2 - using where
  var passStu2 = scores.where((score) => score >= 50);

  // method 2.1 - using where <used .toList to turn the Iterable to a list>
  List<int> passStu3 = scores.where((score) => score >= 50).toList();

  print(passStu);
  print(passStu2);
  print(passStu3);
}
