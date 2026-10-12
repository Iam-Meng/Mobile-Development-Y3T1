class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);

  String get fullName => firstName + ' ' + lastName;
}

void main() {
  Person p1 = Person('Joe', 'Mama');
  print('Firstname: ${p1.firstName}');
  print('Lastname: ${p1.lastName}');
  print('Full name: ${p1.fullName}');

}
