import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ToDoProvider.dart';
import 'AllTaskList.dart';

import 'styles/text_theme.dart';
import 'styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Acme", "Advent Pro");

    // Create MaterialTheme object from exported theme.dart
    final MaterialTheme theme = MaterialTheme(textTheme);


    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        home: const AllTaskList(),
      ),
    );
  }
}


