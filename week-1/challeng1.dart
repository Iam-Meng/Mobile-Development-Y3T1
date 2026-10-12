void printStudent({String name = "", String msg = "HELLO"}) {
  print("$msg $name");
}

// void printStudent({String? name}) {
//   if (name == null) {
//     print("HELLO");
//   } else {
//     print("HELLO $name");
//   }
// }

void main() {
  printStudent();
  printStudent(name: "ronan");
}

///
///   printStudent();     ==> "HELLO"
///   printStudent(name:"ronan");     ==> "HELLO ronan"
/// 
