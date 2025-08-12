import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest/components/color.dart';
import 'package:url_launcher/url_launcher.dart';

class Desktop1 extends StatefulWidget {
  const Desktop1({super.key});

  @override
  State<Desktop1> createState() => _Desktop1State();
}

class _Desktop1State extends State<Desktop1> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // 외부 브라우저에서 열기
        webOnlyWindowName: '_blank', // 웹에서 새 탭으로 열기
      );
    } catch (e) {
      print('URL 실행 중 오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return RepaintBoundary(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              // 최소 높이를 화면 높이로 설정
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              width: MediaQuery.of(context).size.width,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      // 전체 화면을 채우는 SVG 배경
                      child: Image.asset(
                        'assets/images/back.png', // SVG 파일 경로
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    Positioned.fill(
                      // 전체 화면을 채우는 SVG 배경
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: isMobile ? 0 : 40,
                          left: isMobile ? 0 : 40,
                        ),
                        child: isMobile
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  // 아래쪽에 pc1-1.png 배치
                                  Positioned(
                                    bottom: 0,
                                    child: Image.asset(
                                      'assets/images/pc1-1.png',
                                      fit: BoxFit.contain,
                                      width: constraints.maxWidth * 0.8,
                                      height: constraints.maxHeight * 0.6,
                                    ),
                                  ),
                                  // 위쪽에 pc1-2.png 배치 (더 위에 오도록)
                                  Positioned(
                                    top: -20, // 약간 더 위로 이동
                                    child: Image.asset(
                                      'assets/images/pc1-2.png',
                                      fit: BoxFit.contain,
                                      width: constraints.maxWidth * 0.8,
                                      height: constraints.maxHeight * 0.6,
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                alignment: Alignment.center,
                                children: [
                                  // PC 배경에 pc1-1.png 전체 화면으로 배치
                                  Positioned.fill(
                                    child: Image.asset(
                                      'assets/images/1-1.png',
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  // PC 맨 밑 중앙에 pc1-2.png 배치 (해상도 줄일 때 아래로 잘림)
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/1-2.png',
                                        fit: BoxFit.contain,
                                        alignment: Alignment.bottomCenter,
                                        width: constraints.maxWidth *
                                            (screenWidth < 1200
                                                ? 0.4
                                                : screenWidth < 1600
                                                    ? 0.7
                                                    : 0.6),
                                        height: constraints.maxHeight *
                                            (screenWidth < 1200
                                                ? 0.3
                                                : screenWidth < 1600
                                                    ? 0.4
                                                    : 0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: isMobile ? 40 : 30,
                          ),
                          Container(
                            width: isMobile ? screenWidth * 0.6 : 259,
                            height: isMobile ? 40 : 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: Center(
                              child: Text(
                                '상담 스케줄링이 이렇게 쉽다고?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.font1,
                                    fontSize: isMobile ? 14 : 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: isMobile ? 12 : 20,
                          ),
                          Text(
                            '교내 진로진학 상담 솔루션',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: isMobile ? 24 : 36),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: isMobile ? 6 : 8,
                          ),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: isMobile ? 200 : 304,
                            height: isMobile ? 26 : 40,
                          ),
                          SizedBox(
                            height: isMobile ? 15 : 20,
                          ),
                          Text(
                            isMobile
                                ? '퀘스트스쿨은 PC(교사용)와 모바일(학생용)을 통해\n쉽고 간편하게 진로진학 상담 스케줄링이 가능합니다!'
                                : '퀘스트스쿨은 PC(교사용)와 모바일(학생용)을 통해 쉽고 간편하게 진로진학 상담 스케줄링이 가능합니다!',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                                fontSize: isMobile ? 14 : 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: isMobile ? 20 : 30,
                          ),
                          // PC에서 해상도가 낮을 때 버튼 위치 조정
                          Container(
                            margin: EdgeInsets.only(
                              bottom:
                                  isMobile ? 0 : constraints.maxHeight * 0.05,
                            ),
                            child: InkWell(
                              onTap: () => _launchURL(
                                  'https://teacher.questschool.kr/login'),
                              child: Container(
                                height: isMobile ? 48 : 56,
                                width: isMobile ? 180 : 180,
                                decoration: BoxDecoration(
                                  color: AppColor.font1,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        '퀘스트스쿨 바로가기',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isMobile ? 18 : 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
