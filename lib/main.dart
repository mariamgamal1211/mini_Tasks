import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/todo_card.dart';

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
    Task(title: "eating", status: false),
  ];
  void addtask() {
    setState(() {
      allTasks[allTasks.length - 1] = Task(
        title: mycontroller.text,
        status: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(22),
                color: Colors.white24,
                child: Column(
                  children: [
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
            ...allTasks.map(
              (item) => Todocard(cardtitle: item.title, doneorno: item.status),
            ),
          ],
        ),
      ),
    );
  }
}
