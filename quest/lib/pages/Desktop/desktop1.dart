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
    return RepaintBoundary(
      child: Scaffold(
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
                        padding: const EdgeInsets.only(right: 100),
                        child: Image.asset(
                          'assets/images/desk1.png', // SVG 파일 경로
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 89,
                          ),
                          Container(
                            width: 259,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: const Center(
                              child: Text(
                                '상담 스케줄링이 이렇게 쉽다고?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.font1,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            '교내 진로진학 상담 솔루션',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 36),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 304,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            '퀘스트스쿨은 PC(교사용)와 모바일(학생용)을 통해',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          const Text(
                            '쉽고 간편하게 진로진학 상담 스케줄링이 가능합니다!',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () =>
                                _launchURL('https://aboutquestschool.kr/'),
                            child: Container(
                              height: 52,
                              width: 170,
                              decoration: BoxDecoration(
                                color: AppColor.font1,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/logo2.svg',
                                    width: 120,
                                    height: 14,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Center(
                                    child: Text(
                                      '바로가기',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
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
