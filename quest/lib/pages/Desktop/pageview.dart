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
      body: Stack(
        children: [
          // 메인 PageView - 개선된 스크롤 물리학 적용
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            // 더 부드러운 스크롤을 위한 물리학 설정
            physics: const BouncingScrollPhysics(),
            // 페이지 스냅 강화
            pageSnapping: true,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              // 모든 페이지에 PageController 전달하고 NotificationListener로 래핑
              _buildPageWrapper(
                Desktop1(),
                0,
              ),
              _buildPageWrapper(
                Desktop2(pageController: _pageController),
                1,
              ),
              _buildPageWrapper(
                Desktop3(),
                2,
              ),
              _buildPageWrapper(
                Desktop4(),
                3,
              ),
              _buildPageWrapper(
                Desktop5(),
                4,
              ),
              _buildPageWrapper(
                Desktop6(),
                5,
              ),
              _buildPageWrapper(
                Desktop7(),
                6,
              ),
              _buildPageWrapper(
                Desktop8(),
                7,
              ),
              _buildPageWrapper(
                Desktop9(),
                8,
              ),
              _buildPageWrapper(
                Desktop10(pageController: _pageController),
                9,
              ),
            ],
          ),

          // 페이지 인디케이터 (우측)
          Positioned(
            right: 20,
            top: MediaQuery.of(context).size.height * 0.3,
            bottom: MediaQuery.of(context).size.height * 0.3,
            child: _buildPageIndicator(),
          ),

          // 네비게이션 힌트 (하단)
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildNavigationHint(),
          ),
        ],
      ),
    );
  }

  // 각 페이지를 정확한 화면 크기로 래핑하고 스크롤 충돌 방지
  Widget _buildPageWrapper(Widget page, int index) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        // 내부 스크롤이 가장자리에 도달했을 때만 페이지뷰 스크롤 허용
        if (notification is ScrollEndNotification) {
          return false; // 페이지뷰 스크롤 허용
        }

        // 내부 스크롤이 진행 중일 때는 페이지뷰 스크롤 차단
        if (notification is ScrollUpdateNotification) {
          final ScrollMetrics metrics = notification.metrics;

          // 스크롤이 위쪽 끝에 도달했고 위로 스크롤하려는 경우
          if (metrics.pixels <= metrics.minScrollExtent &&
              notification.scrollDelta! < 0) {
            return false; // 페이지뷰 스크롤 허용
          }

          // 스크롤이 아래쪽 끝에 도달했고 아래로 스크롤하려는 경우
          if (metrics.pixels >= metrics.maxScrollExtent &&
              notification.scrollDelta! > 0) {
            return false; // 페이지뷰 스크롤 허용
          }

          // 내부 스크롤이 중간에 있으면 페이지뷰 스크롤 차단
          return true;
        }

        return false;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: page,
      ),
    );
  }

  // 페이지 인디케이터
  Widget _buildPageIndicator() {
    return Container(
      width: 4,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Stack(
        children: [
          // 전체 인디케이터 배경
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // 현재 페이지 인디케이터
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: (_currentPage / 9) *
                (MediaQuery.of(context).size.height * 0.4 - 40),
            child: Container(
              width: 4,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.font1,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 네비게이션 힌트
  Widget _buildNavigationHint() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white70,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              '${_currentPage + 1} / 10',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white70,
              size: 16,
            ),
          ],
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
