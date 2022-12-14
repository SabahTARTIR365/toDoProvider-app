import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_dp_provider_app/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo Main Page'),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<ToDoClass>(context, listen: false)
                      .changeIsDarkMode();
                  print(Provider.of<ToDoClass>(context,listen: false).isDark);
                },
                icon: Icon(Provider.of<ToDoClass>(context).isDark
                    ? Icons.light_mode
                    : Icons.dark_mode))
          ],
        ),
        body: Consumer<ToDoClass>(
          builder: (context, myProvider, widget) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CheckboxListTile(
                  title: Text( myProvider!.isAccepted
                      ? 'Thanks, you juse have accepted my conditions'
                      : 'you have to accept my conditions'),
                  value:  myProvider!.isAccepted,
                  onChanged: (value) {
                    myProvider.changeIsAccepted();
                  }),
              Text(
                myProvider.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text('Change Name attribute'))
            ],
          );
          }
        ));
  }
}
