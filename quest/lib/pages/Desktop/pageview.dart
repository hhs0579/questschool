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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

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
                ],
              ),
            ),
            // 고정 버튼 (중앙 하단)
            Positioned(
              bottom: isMobile ? 20 : 40,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: isMobile ? screenWidth * 0.9 : 950,
                  height: isMobile ? 120 : 95,
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
                    padding: EdgeInsets.all(isMobile ? 15.0 : 20.0),
                    child: isMobile
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '편리하고 안전하게 상담기록 관리하기',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 12),
                              InkWell(
                                onTap: () => _launchURL(
                                    'https://questschoolmall.kr/code'),
                                child: Container(
                                  width: double.infinity,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: AppColor.font1,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '가입 신청하기&학교코드 신청하기',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '편리하고 안전하게 상담기록 관리하기',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () => _launchURL(
                                    'https://questschoolmall.kr/code'),
                                child: Container(
                                  width: 254,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: AppColor.font1,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '가입 신청하기&학교코드 신청하기',
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    // 모바일에서는 화면 높이에 맞춰 조정
    double pageHeight = isMobile ? MediaQuery.of(context).size.height : 1080;

    if (index == 1) {
      // desktop2 - 비디오 페이지 (모바일에서 짧게)
      pageHeight = isMobile ? MediaQuery.of(context).size.height * 0.5 : 1080;
    } else if (index == 2) {
      // desktop3 - 텍스트와 카드 페이지
      pageHeight = isMobile ? MediaQuery.of(context).size.height * 1.8 : 1080;
    } else if (index == 3) {
      // desktop4 - 카드 세로 배치 페이지
      pageHeight = isMobile ? MediaQuery.of(context).size.height * 2.2 : 1080;
    } else if (index == 4) {
      // desktop5 - 더 긴 콘텐츠
      pageHeight = isMobile ? MediaQuery.of(context).size.height * 3.1 : 2400;
    } else if (index == 5) {
      // desktop6 - 중간 길이 콘텐츠
      pageHeight = isMobile ? MediaQuery.of(context).size.height * 1.1 : 1300;
    } else if (index == 6) {
      // desktop7 - 가장 긴 콘텐츠
      pageHeight = isMobile ? MediaQuery.of(context).size.height * 3.2 : 2600;
    } else if (index == 7) {
      // desktop9 - 가장 긴 콘텐츠
      pageHeight = isMobile ? MediaQuery.of(context).size.height * 1.4 : 1080;
    } else if (index == 8) {
      // desktop9 - 가장 긴 콘텐츠
      pageHeight = isMobile ? MediaQuery.of(context).size.height * 3 : 2400;
    }

    return RepaintBoundary(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: pageHeight,
        child: Center(
          child: page,
        ),
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
