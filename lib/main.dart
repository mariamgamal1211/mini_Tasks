import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/todocard.dart';
import 'package:flutter_application_1/widgets/countertasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.light(useMaterial3: true),
      home: FirstProject(),
    );
  }
}

class FirstProject extends StatefulWidget {
  const FirstProject({super.key});

  @override
  State<FirstProject> createState() => _FirstProjectState();
}

class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class _FirstProjectState extends State<FirstProject> {
  final mycontroller = TextEditingController();
  List<Task> allTasks = [
    Task(title: "studynow", status: false),
    Task(title: "calling", status: true),
    Task(title: "eating", status: true),
  ];
  void addtask() {
    setState(() {
      allTasks.add(Task(title: mycontroller.text, status: false));
    });
  }

  int calculatecompletedtask() {
    int completedtask = 0;
    for (var item in allTasks) {
      if (item.status) {
        completedtask++;
      }
    }
    return completedtask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
             
              return Dialog(
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 250,

                  child: Column(
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(11),
                      child: Text("${calculatecompletedtask()}/${allTasks.length}}" ,
                      style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold,color:Colors.white),
                      
                      
                      ),
                    ),
                      TextField(
                        controller: mycontroller,
                        maxLength: 20,
                        decoration: InputDecoration(hintText: "Add new task"),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                        ),

                        onPressed: () {
                          addtask();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "add",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },

        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.9),

      appBar: AppBar(
        title: Text(
          "TO DO app",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
      ),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Countertasks(calculatecompletedtask: calculatecompletedtask,allTasks:allTasks),
            ...allTasks.map(
              (item) => Todocard(cardtitle: item.title, doneorno: item.status),
            ),
          ],
        ),
      ),
    );
  }
}
