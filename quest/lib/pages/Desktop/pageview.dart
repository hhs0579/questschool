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

  @override
  void initState() {
    super.initState();
    // 스크롤 성능 최적화를 위한 설정
    _scrollController.addListener(() {
      // 스크롤 중 불필요한 리빌드 방지
    });
  }

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 메인 스크롤 콘텐츠
          CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              // 각 페이지를 SliverList로 배치
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildOptimizedPageWrapper(
                      _getPageByIndex(index),
                      index,
                    );
                  },
                  childCount: 9, // 총 9개 페이지
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                ),
              ),
            ],
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
                              onTap: () =>
                                  _launchURL('https://questschoolmall.kr/code'),
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
                              onTap: () =>
                                  _launchURL('https://questschoolmall.kr/code'),
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
    );
  }

  // 인덱스에 따른 페이지 반환
  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return Desktop1();
      case 1:
        return Desktop2();
      case 2:
        return Desktop3();
      case 3:
        return Desktop4();
      case 4:
        return Desktop5();
      case 5:
        return Desktop6();
      case 6:
        return Desktop7();
      case 7:
        return Desktop8();
      case 8:
        return Desktop9();
      default:
        return Desktop1();
    }
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
