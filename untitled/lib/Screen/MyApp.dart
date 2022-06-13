import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:untitled/Controller/EmpListController.dart';
import 'package:untitled/Model/Employee.dart';
import 'package:untitled/Screen/SecondPage.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Employee employee = new Employee(name: '', age: 0);

  var empList = Get.put(EmpListController());

  DateTime _dateTime = new DateTime.now();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();

  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print("background");
    }
    if (state == AppLifecycleState.resumed) {
      print("foreground");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('init state');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return MaterialApp(
      title: "First App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Employee Management'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                () => ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: empList.empLst.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.green,
                        child: ListTile(
                          leading: Icon(Icons.account_circle_sharp),
                          title: Text(empList.empLst[index].name),
                          subtitle: Text(empList.empLst[index].age.toString()),
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                empList.empLst.remove(empList.empLst[index]);
                              });
                            },
                          ),
                        ),
                      );
                    }),
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: nameEditingController,
                  onChanged: (name) {
                    setState(() {
                      employee.name = name;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    labelText: "Enter your name",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: ageEditingController,
                  onChanged: (age) {
                    setState(() {
                      employee.age = int.parse(age);
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    labelText: "Enter your age",
                  ),
                ),
              ),
              ButtonTheme(
                height: 40,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    overlayColor: MaterialStateProperty.all(Colors.white38),
                  ),
                  onPressed: () {
                    setState(() {
                      empList.empLst.add(employee);
                    });
                    Fluttertoast.showToast(
                        msg: 'Added$employee',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 14.0);
                    employee = Employee(name: '', age: 0);
                    nameEditingController.text = '';
                    ageEditingController.text = '';
                  },
                  child: const Text('Add Employee'),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(width: 1, color: Colors.redAccent),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: const Text(
                  'Go to second page',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
