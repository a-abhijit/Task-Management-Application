import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';

import '../widgets/appBar_widget.dart';

class NavigationBarHolder extends StatefulWidget {
  const NavigationBarHolder({super.key});

  @override
  State<NavigationBarHolder> createState() => _NavigationBarHolderState();
}

class _NavigationBarHolderState extends State<NavigationBarHolder> {

  int _selectedindex=0;

  final List<Widget> _navigationScreen=[
    ProgressTaskScreen(),
    ProgressTaskScreen(),
    ProgressTaskScreen(),
    ProgressTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(),
        body: _navigationScreen[_selectedindex],

        bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedindex,
            onDestinationSelected: (int index){
              _selectedindex = index;
              setState(() {

              });

            },
            destinations: [
          NavigationDestination(
              icon: Icon(Icons.new_label_outlined), label: "New"),
          NavigationDestination(
              icon: Icon(Icons.bar_chart), label: "Progress"),
          NavigationDestination(
              icon: Icon(Icons.cancel_presentation), label: "Cancelled"),
          NavigationDestination(
              icon: Icon(Icons.done_all_sharp), label: "Compleded"),
        ])
    );
  }
}

