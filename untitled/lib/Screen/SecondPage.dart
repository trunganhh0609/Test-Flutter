import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Screen/DetailPage.dart';
import 'package:untitled/Controller/EmpListController.dart';
import 'package:untitled/Model/Employee.dart';

class SecondPage extends StatelessWidget {
  final EmpListController empCtrll = Get.find();

  @override
  Widget build(context) {
    // empLst = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Employee Management'),
        ),
        body: Center(
          child:Obx(() => ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: empCtrll.empLst.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.green,
                  child: ListTile(
                    leading: Icon(Icons.account_circle_sharp),
                    title: Text(empCtrll.empLst[index].name),
                    subtitle: Text(empCtrll.empLst[index].age.toString()),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DetailPage(empCtrll.empLst[index])));
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        empCtrll.empLst.remove(empCtrll.empLst[index]);
                      },
                    ),
                  ),
                );
              })
          ),
        ));
  }
}
