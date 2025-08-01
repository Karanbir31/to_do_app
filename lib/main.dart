import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    TextTheme textTheme = createTextTheme(context, "Acme", "Advent Pro");

    // Create MaterialTheme object from exported theme.dart
    final MaterialThemeCustom theme = MaterialThemeCustom(textTheme);

    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:  theme.light(),
        darkTheme: theme.dark(),
        home:  AllTaskList(),
      ),
    );
  }
}

/*GetMaterialApp(
      home: LanguageScreen(),
      locale: Locale("en","us")
      translations: ,
    );*/


