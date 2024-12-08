import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/screensized.dart';
import 'package:quest/pages/Desktop/desktop1.dart';
import 'package:quest/pages/Desktop/desktop10.dart';
import 'package:quest/pages/Desktop/desktop2.dart';
import 'package:quest/pages/Desktop/desktop3.dart';
import 'package:quest/pages/Desktop/desktop4.dart';
import 'package:quest/pages/Desktop/desktop5.dart';
import 'package:quest/pages/Desktop/desktop6.dart';
import 'package:quest/pages/Desktop/desktop7.dart';
import 'package:quest/pages/Desktop/desktop8.dart';
import 'package:quest/pages/Desktop/desktop9.dart';
import 'package:quest/pages/Phone/phone1.dart';
import 'package:quest/pages/Phone/phone2.dart';
import 'package:quest/pages/Phone/phone3.dart';
import 'package:quest/pages/Phone/phone4.dart';
import 'package:quest/pages/Phone/phone5.dart';
import 'package:quest/pages/Phone/phone6.dart';
import 'package:quest/pages/Phone/phone7.dart';

class mainPage extends StatelessWidget {
  mainPage({super.key});
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical, // 세로 스크롤
          pageSnapping: true, // 스크롤시 자동으로 페이지에 맞춤
          physics: const BouncingScrollPhysics(),
          children: const [
            // 각 섹션은 화면 전체를 차지
            Phone1(),
            Phone2(),
            Phone3(),
            Phone4(),
            Phone5(),
            Phone6(),
            Phone7()
          ],
        ),
        desktop: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical, // 세로 스크롤
          pageSnapping: true, // 스크롤시 자동으로 페이지에 맞춤
          physics: const BouncingScrollPhysics(),
          children: [
            // 각 섹션은 화면 전체를 차지
            Desktop1(),
            Desktop2(),
            Desktop3(),
            Desktop4(),
            Desktop5(),
            Desktop6(),
            Desktop7(),
            Desktop8(),
            Desktop9(),
            Desktop10(
              pageController: _pageController,
            )
          ],
        ),
      ),
    );
  }
}
