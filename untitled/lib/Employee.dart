import 'package:get/get.dart';

class Employee{
  String name;
  int age;
  Employee({required this.name, required this.age});

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
  }
}