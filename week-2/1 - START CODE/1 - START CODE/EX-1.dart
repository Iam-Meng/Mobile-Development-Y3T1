enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address({
    required this.street,
    required this.city,
    required this.zipCode,
  });

  String get fullAddress => '$street, $city $zipCode';
}

class Employee {
  final String name;
  final double baseSalary;
  final Skill skill;
  final Address address;
  final int yearsOfExperience;

  const Employee({
    required this.name,
    required this.baseSalary,
    required this.skill,
    required this.address,
    required this.yearsOfExperience,
  });

  double computeSalary() {
    double salaryPerYears = yearsOfExperience * 2000;
    if (skill == Skill.DART) {
      return (baseSalary + salaryPerYears + 3000);
    } else if (skill == Skill.FLUTTER) {
      return (baseSalary + salaryPerYears + 5000);
    } else {
      return (baseSalary + salaryPerYears + 1000);
    }
  }

  void printDetails() {
    print(
      'Employee: $name, Base Salary: \$${baseSalary}\n' +
          'Skill: $skill, Years of experience: $yearsOfExperience\n' +
          'Address: ${address.fullAddress}\n' +
          'Total salary: \$${computeSalary()}',
    );
  }
}

void main() {
  var emp1 = Employee(
    name: 'Meng',
    baseSalary: 40000,
    skill: Skill.DART,
    address: Address(
      street: 'Preak Liep',
      city: 'Phnom Penh',
      zipCode: '12345',
    ),
    yearsOfExperience: 3,
  );
  emp1.printDetails();

  var emp2 = Employee(
    name: 'Ronan',
    baseSalary: 45000,
    skill: Skill.FLUTTER,
    address: Address(street: 'TK', city: 'Phnom Penh', zipCode: '12345'),
    yearsOfExperience: 40,
  );
  emp2.printDetails();
}
