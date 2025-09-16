import 'package:flutter/material.dart';
class TaskCountWidget extends StatelessWidget {
  final int count;
  final String status;

  const TaskCountWidget({
    super.key, required this.count, required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 7),
        child: Column(
          children: [
            Text(count.toString(),style: Theme.of(context).textTheme.titleLarge,),
            Text(status),
          ],
        ),
      ),
    );
  }
}