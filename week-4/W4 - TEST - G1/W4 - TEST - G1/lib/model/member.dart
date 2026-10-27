class Member {
  final String id;
  final String name;
  final bool isPremium;

  Member({required this.id, required this.name, this.isPremium = false});

  int get maxBooks => isPremium? 4 : 2;
}
