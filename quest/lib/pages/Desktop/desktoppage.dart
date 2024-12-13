import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/widget/imageslider.dart';
import 'package:quest/widget/review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopPage extends StatefulWidget {
  final YoutubePlayerController youtubeController;
  DesktopPage({
    Key? key,
    required this.youtubeController,
  }) : super(key: key);

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
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

  late YoutubePlayerController _controller;
  bool a = true;
  bool b = false;
  bool c = false;
  bool d = false;
  bool t = true;
  bool s = false;
  @override
  void initState() {
    super.initState();
    // 컨트롤러 초기화

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % svgPaths.length;
      });
    });
  }

  // 다이얼로그 표시 함수
  void _showVideoDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: true, // 다이얼로그 바깥을 누르면 닫기
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // 다이얼로그 모서리 둥글게
          ),
          child: SizedBox(
            width: 720,
            height: 540,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent, // 다이얼로그 배경색
                borderRadius: BorderRadius.circular(16),
              ),
              child: YoutubePlayer(
                controller: YoutubePlayerController.fromVideoId(
                  videoId: 'LUWbfI17_UU',
                  params: const YoutubePlayerParams(
                    showControls: true,
                    showFullscreenButton: true,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  final List<String> svgPaths = [
    'assets/images/signup1.png',
    'assets/images/signup2.png',
    'assets/images/signup3.png',
    'assets/images/signup4.png',
  ];

  int currentIndex = 0;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel(); // 타이머 정리
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            //1번
            Container(
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

                    child: Image.asset(
                      'assets/images/desk1.png', // SVG 파일 경로
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
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
                  Positioned(
                    bottom: 38,
                    left: (MediaQuery.of(context).size.width - 970) / 2,
                    child: Container(
                      width: 970,
                      height: 95,
                      decoration: BoxDecoration(
                        color: const Color(0xff414042),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '편리하고 안전하게 상담기록 관리하기',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
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
                                    '가입 신청하기&학교 코드 신청하기',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //2번
            Container(
              color: Color(0xff141414),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                'assets/images/desk2.svg',
              ),
            ),
            //3번

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                'assets/images/desk3.svg',
                fit: BoxFit.contain,
              ),
            ),

            //4번

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/desk4.png',
                fit: BoxFit.contain,
              ),
            ),

            //5번

            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Positioned.fill(
                    // 전체 화면을 채우는 SVG 배경
                    child: Image.asset(
                      'assets/images/back2.png', // SVG 파일 경로
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 135,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 425,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(text: '상담 예약부터\n'),
                                        TextSpan(text: '상담 기록 관리, 결과보고서까지')
                                      ]),
                                ),
                                const Text.rich(
                                  TextSpan(
                                      style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: '퀘스트 스쿨 ',
                                            style: TextStyle(
                                                color: AppColor.font1)),
                                        TextSpan(text: '하나로 끝!')
                                      ]),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () => _showVideoDialog(context),
                                  child: Container(
                                    width: 215,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: AppColor.font1,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '튜토리얼 영상 보기',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 56,
                                ),
                                a
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffDFDFDF)),
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  color: AppColor.font1,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColor.font1
                                                          .withOpacity(0.4),
                                                      spreadRadius: 5,
                                                      blurRadius: 4,
                                                      offset:
                                                          const Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                height: 95,
                                                width: 2,
                                                color: AppColor.font1,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '상담 요청 관리',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(height: 16),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff414042),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99)),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Text.rich(
                                                    TextSpan(
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xff414042)),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                '상담·상담확인서 요청 확인 및\n'),
                                                        TextSpan(
                                                            text:
                                                                '수락·거절·취소 등 전반적인 상담 관리 '),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                a = !a;
                                                b = false;
                                                c = false;
                                                d = false;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.keyboard_arrow_up,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffDFDFDF)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99),
                                                    color: Colors.transparent),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                height: 36,
                                                width: 2,
                                                color: const Color(0xff93969B),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '상담 요청 관리',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff93969B)),
                                              ),
                                              SizedBox(height: 16),
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                a = !a;
                                                b = false;
                                                c = false;
                                                d = false;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 30,
                                              color: Color(0xff93969B),
                                            ),
                                          ),
                                        ],
                                      ),
                                const SizedBox(
                                  height: 20,
                                ),
                                b
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffDFDFDF)),
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  color: AppColor.font1,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColor.font1
                                                          .withOpacity(0.4),
                                                      spreadRadius: 5,
                                                      blurRadius: 4,
                                                      offset:
                                                          const Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                height: 95,
                                                width: 2,
                                                color: AppColor.font1,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '상담 요청 관리',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(height: 16),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff414042),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99)),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Text.rich(
                                                    TextSpan(
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xff414042)),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                '학생이 작성한 상담 요청 주제와 상담\n'),
                                                        TextSpan(
                                                            text: '내용 확인 가능'),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                a = false;
                                                b = !b;
                                                c = false;
                                                d = false;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.keyboard_arrow_up,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffDFDFDF)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99),
                                                    color: Colors.transparent),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                height: 36,
                                                width: 2,
                                                color: const Color(0xff93969B),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '상담 내용 상세 확인',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff93969B)),
                                              ),
                                              SizedBox(height: 16),
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                a = false;
                                                b = !b;
                                                c = false;
                                                d = false;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 30,
                                              color: Color(0xff93969B),
                                            ),
                                          ),
                                        ],
                                      ),
                                const SizedBox(
                                  height: 20,
                                ),
                                c
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffDFDFDF)),
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  color: AppColor.font1,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColor.font1
                                                          .withOpacity(0.4),
                                                      spreadRadius: 5,
                                                      blurRadius: 4,
                                                      offset:
                                                          const Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                height: 95,
                                                width: 2,
                                                color: AppColor.font1,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '학생 진로심리검사 내용 확인',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(height: 16),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff414042),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99)),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Text.rich(
                                                    TextSpan(
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xff414042)),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                '상담 전, 학생이 실시한 진로심리검사\n'),
                                                        TextSpan(
                                                            text:
                                                                '내용을 확인하여 학생별 특성을 고려한\n'),
                                                        TextSpan(
                                                            text: '상담준비\n '),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                a = false;
                                                b = false;
                                                c = !c;
                                                d = false;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.keyboard_arrow_up,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffDFDFDF)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99),
                                                    color: Colors.transparent),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                height: 36,
                                                width: 2,
                                                color: const Color(0xff93969B),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '학생 진로심리검사 내용 확인',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff93969B)),
                                              ),
                                              SizedBox(height: 16),
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                a = false;
                                                b = false;
                                                c = !c;
                                                d = false;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 30,
                                              color: Color(0xff93969B),
                                            ),
                                          ),
                                        ],
                                      ),
                                const SizedBox(
                                  height: 20,
                                ),
                                d
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffDFDFDF)),
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  color: AppColor.font1,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColor.font1
                                                          .withOpacity(0.4),
                                                      spreadRadius: 5,
                                                      blurRadius: 4,
                                                      offset:
                                                          const Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                height: 95,
                                                width: 2,
                                                color: AppColor.font1,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '상담 후 내용 정리',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(height: 16),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff414042),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99)),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const Text.rich(
                                                    TextSpan(
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xff414042)),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                '상담 후 내용 정리하고 다운로드\n'),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                a = false;
                                                b = false;
                                                c = false;
                                                d = !d;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.keyboard_arrow_up,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffDFDFDF)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99),
                                                    color: Colors.transparent),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                height: 36,
                                                width: 2,
                                                color: const Color(0xff93969B),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '상담 후 내용 정리',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff93969B)),
                                              ),
                                              SizedBox(height: 16),
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                a = false;
                                                b = false;
                                                c = false;
                                                d = !d;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 30,
                                              color: Color(0xff93969B),
                                            ),
                                          ),
                                        ],
                                      ),
                              ]),
                        ),
                        const SizedBox(
                          width: 92,
                        ),
                        if (a) SvgPicture.asset('assets/images/computer_1.svg'),
                        if (b) SvgPicture.asset('assets/images/computer_2.svg'),
                        if (c) SvgPicture.asset('assets/images/computer_3.svg'),
                        if (d) SvgPicture.asset('assets/images/computer_4.svg'),
                      ],
                    ),
                  )
                ])),

            //6번

            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Positioned.fill(
                    // 전체 화면을 채우는 SVG 배경
                    child: Image.asset(
                      'assets/images/back.png', // SVG 파일 경로
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 308),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: '세계적으로 가장 권위있는\n'),
                                    TextSpan(
                                      text: '국제표준 정보보호 인증',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'ISO 27001:2013 취득',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w800,
                                    color: AppColor.font1),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '높은 수준의 정보보호 시스템으로 민감한 정보의\n'),
                                    TextSpan(
                                      text: '빈틈없는 보안,안심할 수 있는 안전한 서비스 퀘스트스쿨',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: 670,
                            height: 558,
                            child: Image.asset(
                              'assets/images/desk6.png',
                              fit: BoxFit.contain,
                            ))
                      ],
                    ),
                  )
                ])),

            //7번
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 135, top: 237),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 36,
                                  color: Colors.black),
                              children: [
                                TextSpan(text: '현직 진로 선생님들의 이야기에\n'),
                                TextSpan(
                                    text: '귀 기울여 제작하였습니다',
                                    style: TextStyle(color: AppColor.font1)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black),
                              children: [
                                TextSpan(text: '앞으로도 선생님과 학생들의 이야기를 통해\n'),
                                TextSpan(text: '업데이트를 진행하겠습니다.'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 192,
                            height: 44,
                            decoration: BoxDecoration(
                                color: AppColor.font1,
                                borderRadius: BorderRadius.circular(99)),
                            child: const Center(
                              child: Text(
                                '퀘스트스쿨 소식 듣기',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 130,
                    ),
                    const ImageSlider(),
                  ],
                )),

            //8번
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.only(left: 135, top: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('실제 상담 후기',
                          style: TextStyle(
                              fontSize: 24,
                              color: AppColor.font1,
                              fontWeight: FontWeight.w800)),
                      SizedBox(
                        height: 16,
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 36,
                              color: Colors.black),
                          children: [
                            TextSpan(text: '먼저 경험한 학교의\n'),
                            TextSpan(
                              text: '후기를 확인해 보세요.',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black),
                          children: [
                            TextSpan(text: '서비스를 이용한 학생들과 선생님이 직접 작성한 내용이며,\n'),
                            TextSpan(
                              text: '퀘스트스쿨에서 확인할 수 있습니다.',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        height: 74,
                        width: 238,
                        child: SvgPicture.asset(
                          'assets/images/desk8.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                hoverColor: Colors.transparent, // 호버 효과 제거
                                onTap: () {
                                  setState(() {
                                    t = !t;
                                    s = !s;
                                  });
                                },
                                child: Container(
                                  width: 123,
                                  height: 44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99),
                                      color:
                                          t ? Color(0xff414042) : Colors.white,
                                      border:
                                          Border.all(color: Color(0xff93969B))),
                                  child: Center(
                                      child: Text(
                                    '선생님 12',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: t
                                            ? Colors.white
                                            : Color(0xff93969B)),
                                  )),
                                ),
                              ),
                              SizedBox(height: 16),
                              InkWell(
                                hoverColor: Colors.transparent, // 호버 효과 제거
                                onTap: () {
                                  setState(() {
                                    t = !t;
                                    s = !s;
                                  });
                                },
                                child: Container(
                                  width: 123,
                                  height: 44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99),
                                      color:
                                          s ? Color(0xff414042) : Colors.white,
                                      border:
                                          Border.all(color: Color(0xff93969B))),
                                  child: Center(
                                      child: Text(
                                    '학생 27',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: s
                                            ? Colors.white
                                            : Color(0xff93969B)),
                                  )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 77,
                          ),
                          ReviewsSection()
                        ],
                      )
                    ],
                  ),
                )),

            //9번
            Container(
              color: Color(0xffEEEEEE),
              height: MediaQuery.of(context).size.height,
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
            ),
//10번
            Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 36,
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text: '퀘스트스쿨',
                              style: TextStyle(color: AppColor.font1)),
                          TextSpan(
                            text: '의 홍보용 영상',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: YoutubePlayer(
                        controller: widget.youtubeController,
                        aspectRatio: 16 / 9,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 135, vertical: 120),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 213,
                                    height: 105,
                                    child: SvgPicture.asset(
                                        'assets/images/footer_logo.svg')),
                                SizedBox(
                                  height: 20,
                                ),
                                Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text:
                                              '퀘스트스쿨은 진로 콘텐츠 전문 기업 사자가온다(주)에서\n'),
                                      TextSpan(
                                          text: '개발한 교내 진로진학 상담 솔루션 서비스입니다.'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 37,
                                ),
                                Text(
                                  'Copyright ⓒ 2023 사자가온다㈜ All rights reserved.',
                                  style: TextStyle(
                                      color: AppColor.grey1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () =>
                                            _launchURL('https://sjgod.kr/'),
                                        child: Text(
                                          '회사소개',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        )),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          _launchURL(
                                              'https://minjae7189.notion.site/87708aafc4fa48e0aed3d95a397ab5f5');
                                        },
                                        child: Text(
                                          '듀토리얼 확인하기',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        )),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    InkWell(
                                        onTap: () => _launchURL(
                                            'https://pf.kakao.com/_KAQxhb'),
                                        child: Text(
                                          '문의하기',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 130,
                                ),
                                Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(text: 'AM 10:00 - PM 17:00\n'),
                                      TextSpan(
                                          text: '점심 PM 12:30 - PM 13:30\n'),
                                      TextSpan(text: '공휴일,주말 휴무'),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),
                    )
                  ],
                )),
          ])),
    );
  }
}
