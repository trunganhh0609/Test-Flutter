import 'package:flutter/material.dart';
import 'package:untitled/Employee.dart';

class DetailPage extends StatelessWidget{
  Employee employee;

  DetailPage(this.employee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Employee'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Name:' + employee.name + '\n' + 'Age: ' + employee.age.toString()),
        ),
      ),
    );
  }


}