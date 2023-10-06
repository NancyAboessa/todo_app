import 'package:flutter/material.dart';
import 'package:todo_app/baidaa.dart';
import 'package:todo_app/data%20base%20helper.dart';
import 'package:todo_app/todo.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = DbHelper();
  await db.initDatabase();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:login(),
    );
  }
}

