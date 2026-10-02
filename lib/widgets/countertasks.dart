import 'package:flutter/material.dart';

class Countertasks extends StatelessWidget {
  final Function calculatecompletedtask;
  final List allTasks;
  const Countertasks({super.key,
  required this.calculatecompletedtask,
  required this.allTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11),
      child: Text(
        "${calculatecompletedtask()}/${allTasks.length}",
        style: TextStyle(
          fontSize: 33,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
