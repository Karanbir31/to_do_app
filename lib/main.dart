import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ToDoProvider.dart';
import 'AllTaskList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const AllTaskList(),
      ),
    );
  }
}


