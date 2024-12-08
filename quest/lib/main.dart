import 'package:flutter/material.dart';
import 'package:quest/components/scroll.dart';
import 'package:quest/pages/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'QUEST SCHOOL',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          fontFamily: 'Pretendard',
        ),
        scrollBehavior: MyCustomScrollBehavior(),
        home: MainPage());
  }
}
