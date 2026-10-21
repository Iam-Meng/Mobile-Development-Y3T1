enum Gender { female, male }

class Patient {
  final String id;
  final String name;
  final Gender gender;

  Patient({required this.id, required this.name, required this.gender});
}
