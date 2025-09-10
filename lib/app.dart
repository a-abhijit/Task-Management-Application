import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32
          )
        ),

        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: Size.fromWidth(400),
                padding: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            )

        ),

        colorSchemeSeed: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
        )
      ),



      home: SplashScreen(),
    );
  }
}
