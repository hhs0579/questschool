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
  final ScrollController _scrollController = ScrollController();

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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // 메인 스크롤 콘텐츠
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // 각 페이지를 순서대로 배치
                  _buildOptimizedPageWrapper(Desktop1(), 0),
                  _buildOptimizedPageWrapper(Desktop2(), 1),
                  _buildOptimizedPageWrapper(Desktop3(), 2),
                  _buildOptimizedPageWrapper(Desktop4(), 3),
                  _buildOptimizedPageWrapper(Desktop5(), 4),
                  _buildOptimizedPageWrapper(Desktop6(), 5),
                  _buildOptimizedPageWrapper(Desktop7(), 6),
                  _buildOptimizedPageWrapper(Desktop8(), 7),
                  _buildOptimizedPageWrapper(Desktop9(), 8),
                  _buildOptimizedPageWrapper(Desktop10(), 9),
                ],
              ),
            ),
            // 고정 버튼 (중앙 하단)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 950,
                  height: 95,
                  decoration: BoxDecoration(
                    color: const Color(0xff414042).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            '편리하고 안전하게 상담기록 관리하기',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () =>
                              _launchURL('https://questschoolmall.kr/code'),
                          child: Container(
                            width: 254,
                            height: 52,
                            decoration: BoxDecoration(
                              color: AppColor.font1,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                '가입 신청하기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptimizedPageWrapper(Widget page, int index) {
    // 5번째, 6번째, 7번째 페이지만 높이를 늘림 (인덱스 4, 5, 6)
    double pageHeight = MediaQuery.of(context).size.height;
    if (index == 4) {
      // desktop5
      pageHeight = MediaQuery.of(context).size.height * 2.2;
    } else if (index == 5) {
      // desktop6
      pageHeight = MediaQuery.of(context).size.height * 1.2;
    } else if (index == 6) {
      // desktop7
      pageHeight = MediaQuery.of(context).size.height * 2.35;
    }

    return RepaintBoundary(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: pageHeight,
        child: page,
      ),
    );
  }
}

// 각 Desktop 페이지에서 적용할 개선된 구조
/*
class Desktop1 extends StatefulWidget {
  final PageController? pageController;
  
  const Desktop1({
    super.key,
    this.pageController,
  });
  
  @override
  State<Desktop1> createState() => _Desktop1State();
}

class _Desktop1State extends State<Desktop1> {
  final ScrollController _scrollController = ScrollController();
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          // 고정 헤더
          Container(
            height: 100,
            child: // 헤더 콘텐츠
          ),
          
          // 스크롤 가능한 메인 콘텐츠
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              // 더 부드러운 스크롤을 위한 물리학 설정
              physics: const BouncingScrollPhysics(),
              child: // 페이지 콘텐츠
            ),
          ),
          
          // 고정 푸터 (선택사항)
          Container(
            height: 60,
            child: // 푸터 콘텐츠
          ),
        ],
      ),
    );
  }
}
*/
