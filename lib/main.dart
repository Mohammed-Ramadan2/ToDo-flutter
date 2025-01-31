import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/todo.dart';

void main() async{
  Hive.initFlutter();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Todoscreen(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}