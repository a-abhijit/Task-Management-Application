import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_newtask_screen.dart';
import '../widgets/card_widget.dart';
import '../widgets/task_listview.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewtaskScreen()));


        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return TaskCountWidget(count: 09, status: "status");
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 8);
              },
              itemCount: 4,
            ),
          ),
          TaskListView(),
        ],
      ),
    );
  }
}


