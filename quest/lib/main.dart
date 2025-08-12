import 'package:flutter/material.dart';
import 'package:quest/components/scroll.dart';
import 'package:quest/pages/mainpage.dart';
import 'package:flutter/foundation.dart';

void main() {
  if (kIsWeb) {
    // 웹에서 에러 무시 설정
    FlutterError.onError = (FlutterErrorDetails details) {
      if (!details.toString().contains('nativeCommunication')) {
        FlutterError.presentError(details);
      }
    };
  }
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
          useMaterial3: true,
          fontFamily: 'Pretendard',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)
              .copyWith(background: Colors.white),
        ),
        scrollBehavior: MyCustomScrollBehavior(),
        home: MainPage());
  }
}
