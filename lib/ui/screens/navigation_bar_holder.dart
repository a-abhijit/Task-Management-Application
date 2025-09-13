import 'package:flutter/material.dart';

class NavigationBarHolder extends StatefulWidget {
  const NavigationBarHolder({super.key});

  @override
  State<NavigationBarHolder> createState() => _NavigationBarHolderState();
}

class _NavigationBarHolderState extends State<NavigationBarHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        bottomNavigationBar: NavigationBar(destinations: [
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