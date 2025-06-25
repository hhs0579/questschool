import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest/components/color.dart';
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
import 'package:url_launcher/url_launcher.dart';

class SmoothPageViewScreen extends StatefulWidget {
  const SmoothPageViewScreen({super.key});

  @override
  State<SmoothPageViewScreen> createState() => _SmoothPageViewScreenState();
}

class _SmoothPageViewScreenState extends State<SmoothPageViewScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    } catch (e) {
      print('URL 실행 중 오류 발생: $e');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical, // 세로 스크롤
        physics: const ClampingScrollPhysics(), // 부드러운 스크롤 물리학
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          // 첫 번째 페이지 (기존 Desktop1 내용)
          Desktop1(),
          Desktop2(
            pageController: _pageController,
          ),
          Desktop3(),
          Desktop4(),
          Desktop5(),
          Desktop6(),
          Desktop7(),
          Desktop8(),
          Desktop9(),
          Desktop10(
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
