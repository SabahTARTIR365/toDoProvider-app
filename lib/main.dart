import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_dp_provider_app/providers/todo_provider.dart';
import 'package:todo_dp_provider_app/ui/screens/todo_main_screen.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<ToDoClass>(
        create: (context) {
          return ToDoClass();
        },
        child: AppInit());
  }
}

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: Provider.of<ToDoClass>(context, listen: false).isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      title: 'gsk',
      home: TodoMainScreen(),
    );
  }
}