import 'package:flutter/material.dart';
class TaskListView extends StatelessWidget {
  const TaskListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              "sdcb uscus skji",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "hjbshjcbs jsbhcbhbds kjsbhcb",
                  style: TextTheme.of(context).titleSmall,
                ),
                SizedBox(height: 4),
                Text(
                  DateTime.now().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5,),

                Row(

                  children: [
                    Chip(

                      label: Text(
                        "New",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),

                    IconButton(onPressed: (){}, icon: Icon(Icons.delete))

                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 8);
        },
        itemCount: 15,
      ),
    );
  }
}