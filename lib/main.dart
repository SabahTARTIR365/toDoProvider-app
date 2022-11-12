import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_dp_provider_app/providers/todo_provider.dart';
import 'package:todo_dp_provider_app/ui/screens/todo_main_screen.dart';

import 'data_reposotory/dbl_helper.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await DbHelper.dpHelper.initDataBase();
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
      theme: Provider.of<ToDoClass>(context).isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      title: 'gsk',
      home: TodoMainScreen(),
    );
  }
}