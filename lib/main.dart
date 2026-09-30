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

  Task({
    required this.title,
    required this.status,
  });
}

List<Task> allTasks = [
  Task(title: "studynow", status: false),
  Task(title: "calling", status: true),
  Task(title: "eating", status: false),
];

class _FirstProjectState extends State<FirstProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              (item) => Todocard(
                cardtitle: item.title,
                doneorno: item.status,
              ),
            ),
          ],
        ),
      ),
    );
  }
}