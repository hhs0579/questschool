import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Desktop9 extends StatefulWidget {
  const Desktop9({super.key});

  @override
  State<Desktop9> createState() => _Desktop9State();
}

class _Desktop9State extends State<Desktop9> {
  final List<String> svgPaths = [
    'assets/images/signup1.png',
    'assets/images/signup2.png',
    'assets/images/signup3.png',
    'assets/images/signup4.png',
  ];

  int currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // 3초마다 이미지 전환
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % svgPaths.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // 타이머 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500), // 페이드 효과 duration
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Image.asset(
                svgPaths[currentIndex],
                key: ValueKey<int>(
                    currentIndex), // AnimatedSwitcher를 위한 unique key
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
