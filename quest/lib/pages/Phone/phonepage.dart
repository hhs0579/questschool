import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/widget/imageslider.dart';
import 'package:quest/widget/review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PhonePage extends StatefulWidget {
  final YoutubePlayerController youtubeController;
  PhonePage({
    Key? key,
    required this.youtubeController,
  }) : super(key: key);

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  YoutubePlayerController? _controller;
  bool a = true;
  bool b = false;
  bool c = false;
  bool d = false;

  @override
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % svgPaths.length;
      });
    });
  }

  // 다이얼로그 표시 함수
  void _showVideoDialog(BuildContext context) async {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: 'NMjhjrBIrG8',
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 220,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: YoutubePlayer(
                controller: controller,
              ),
            ),
          ),
        );
      },
    );

    controller.close(); // 다이얼로그가 닫힐 때 컨트롤러 정리
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
    _timer.cancel();
    super.dispose();
  }

  final List<String> svgPaths = [
    'assets/images/psignup1.png',
    'assets/images/psignup2.png',
    'assets/images/psignup3.png',
    'assets/images/psignup4.png',
  ];

  int currentIndex = 0;
  late Timer _timer;

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
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/pback.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/phone1.png',
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
                                fontSize: 24),
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
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 74,
                        decoration: const BoxDecoration(
                          color: Color(0xff414042),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '교내 진로진학 상담 솔루션',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '퀘스트 스쿨',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () => _launchURL(
                                    'https://questschoolmall.kr/code'),
                                child: Container(
                                  width: 170,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: AppColor.font1,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '가입 신청하기',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
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
                color: Color(0xFF141414),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  'assets/images/phone2.svg',
                  fit: BoxFit.contain,
                ),
              ),

              //3번
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  'assets/images/phone3.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/phone4.png',
                  fit: BoxFit.contain,
                ),
              ),
//4번
              Container(
                child: Stack(children: [
                  // 전체 화면을 채우는 SVG 배경
                  Image.asset(
                    'assets/images/back3.png', // SVG 파일 경로
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '상담 예약부터',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                ),
                                Text(
                                  '상담 기록 관리, 결과보고서까지',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                ),
                                const Text.rich(
                                  TextSpan(
                                      style: TextStyle(
                                          fontSize: 20,
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
                                  height: 16,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                      color: AppColor.font1,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColor.font1
                                                              .withOpacity(0.4),
                                                          spreadRadius: 5,
                                                          blurRadius: 4,
                                                          offset: const Offset(
                                                              0, 0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    height: 312,
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 8),
                                                        height: 5,
                                                        width: 5,
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xff414042),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        99)),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text.rich(
                                                            TextSpan(
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                          SizedBox(
                                                            height: 14,
                                                          ),
                                                          Container(
                                                              width: 290,
                                                              height: 244.5,
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/computer_1.svg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffDFDFDF)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99),
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    height: 36,
                                                    width: 2,
                                                    color:
                                                        const Color(0xff93969B),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff93969B)),
                                                  ),
                                                  SizedBox(height: 16),
                                                ],
                                              ),
                                            ],
                                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                      color: AppColor.font1,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColor.font1
                                                              .withOpacity(0.4),
                                                          spreadRadius: 5,
                                                          blurRadius: 4,
                                                          offset: const Offset(
                                                              0, 0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    height: 312,
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 8),
                                                        height: 5,
                                                        width: 5,
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xff414042),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        99)),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Column(
                                                        children: [
                                                          const Text.rich(
                                                            TextSpan(
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16,
                                                                  color: Color(
                                                                      0xff414042)),
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        '학생이 작성한 상담 요청 주제와 상담\n'),
                                                                TextSpan(
                                                                    text:
                                                                        '내용 확인 가능'),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                              width: 290,
                                                              height: 244.5,
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/computer_2.svg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffDFDFDF)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99),
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    height: 36,
                                                    width: 2,
                                                    color:
                                                        const Color(0xff93969B),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff93969B)),
                                                  ),
                                                  SizedBox(height: 16),
                                                ],
                                              ),
                                            ],
                                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                      color: AppColor.font1,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColor.font1
                                                              .withOpacity(0.4),
                                                          spreadRadius: 5,
                                                          blurRadius: 4,
                                                          offset: const Offset(
                                                              0, 0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    height: 312,
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 8),
                                                        height: 5,
                                                        width: 5,
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xff414042),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        99)),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Column(
                                                        children: [
                                                          const Text.rich(
                                                            TextSpan(
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                                    text:
                                                                        '상담준비\n '),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                              width: 290,
                                                              height: 244.5,
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/computer_3.svg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffDFDFDF)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99),
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    height: 36,
                                                    width: 2,
                                                    color:
                                                        const Color(0xff93969B),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff93969B)),
                                                  ),
                                                  SizedBox(height: 16),
                                                ],
                                              ),
                                            ],
                                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                      color: AppColor.font1,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColor.font1
                                                              .withOpacity(0.4),
                                                          spreadRadius: 5,
                                                          blurRadius: 4,
                                                          offset: const Offset(
                                                              0, 0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    height: 312,
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 8),
                                                        height: 5,
                                                        width: 5,
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xff414042),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        99)),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Column(
                                                        children: [
                                                          const Text.rich(
                                                            TextSpan(
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                          Container(
                                                              width: 290,
                                                              height: 244.5,
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/computer_4.svg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffDFDFDF)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99),
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    height: 36,
                                                    width: 2,
                                                    color:
                                                        const Color(0xff93969B),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff93969B)),
                                                  ),
                                                  SizedBox(height: 16),
                                                ],
                                              ),
                                            ],
                                          ),
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
                          height: 30,
                        ),
                        // if (a) SvgPicture.asset('assets/images/computer_1.svg'),
                        // if (b) SvgPicture.asset('assets/images/computer_2.svg'),
                        // if (c) SvgPicture.asset('assets/images/computer_3.svg'),
                        // if (d) SvgPicture.asset('assets/images/computer_4.svg'),
                      ],
                    ),
                  )
                ]),
              ),
              //6번
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(children: [
                    Positioned.fill(
                      // 전체 화면을 채우는 SVG 배경
                      child: Image.asset(
                        'assets/images/back4.png', // SVG 파일 경로
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                Text(
                                  '세계적으로 가장 권위있는',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Text(
                                  '국제표준 정보보호 인증',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'ISO 27001:2013 취득',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: AppColor.font1),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  '높은 수준의 정보보호 시스템으로 민감한 정보의',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                                Text(
                                  '빈틈없는 보안,안심할 수 있는 안전한 서비스 퀘스트스쿨',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 96,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              child: Image.asset(
                                'assets/images/desk6.png',
                                fit: BoxFit.contain,
                              ))
                        ],
                      ),
                    )
                  ])),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '현직 진로 선생님들의 이야기에',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Text('귀 기울여 제작하였습니다',
                          style: TextStyle(
                            color: AppColor.font1,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                      const SizedBox(height: 16),
                      Text(
                        '앞으로도 선생님과 학생들의 이야기를 통해',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      Text(
                        '업데이트를 진행하겠습니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 16,
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
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(child: const ImageSlider2()),
                    ],
                  ),
                ),
              ),
              //8번
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text('실제 상담 후기',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColor.font1,
                                fontWeight: FontWeight.w800)),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '먼저 경험한 학교의',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Text(
                          '후기를 확인해 보세요.',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          '서비스를 이용한 학생들과 선생님이 직접 작성한 내용이며,',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        Text(
                          '퀘스트스쿨에서 확인할 수 있습니다.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 16,
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
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              hoverColor: Colors.transparent, // 호버 효과 제거
                              onTap: () {
                                setState(() {
                                  a = !a;
                                  b = !b;
                                });
                              },
                              child: Container(
                                width: 116,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    color: a ? Color(0xff414042) : Colors.white,
                                    border:
                                        Border.all(color: Color(0xff93969B))),
                                child: Center(
                                    child: Text(
                                  '선생님 12',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color:
                                          a ? Colors.white : Color(0xff93969B)),
                                )),
                              ),
                            ),
                            SizedBox(width: 4),
                            InkWell(
                              hoverColor: Colors.transparent, // 호버 효과 제거
                              onTap: () {
                                setState(() {
                                  a = !a;
                                  b = !b;
                                });
                              },
                              child: Container(
                                width: 116,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    color: b ? Color(0xff414042) : Colors.white,
                                    border:
                                        Border.all(color: Color(0xff93969B))),
                                child: Center(
                                    child: Text(
                                  '학생 27',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color:
                                          b ? Colors.white : Color(0xff93969B)),
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 67,
                            ),
                            ReviewsSection(),
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
                  duration:
                      const Duration(milliseconds: 500), // 페이드 효과 duration
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
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
                color: Color(0xffEEEEEE),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
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
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: YoutubePlayer(
                        controller: YoutubePlayerController.fromVideoId(
                          videoId: 'NMjhjrBIrG8',
                          params: const YoutubePlayerParams(
                            showControls: true,
                            showFullscreenButton: true,
                            mute: false,
                            loop: false,
                            enableCaption: false,
                          ),
                        ),
                        aspectRatio: 16 / 9,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 213,
                              height: 105,
                              child: SvgPicture.asset(
                                  'assets/images/footer_logo.svg')),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '퀘스트스쿨은 진로 콘텐츠 전문 기업 사자가온다(주)에서',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          Text(
                            '개발한 교내 진로진학 상담 솔루션 서비스입니다.',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () => _launchURL('https://sjgod.kr/'),
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
                                  onTap: () {},
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'AM 10:00 - PM 17:00',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                              Text(
                                '점심 PM 12:30 - PM 13:30',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                'Copyright ⓒ 2023 사자가온다㈜ All rights reserved.',
                                style: TextStyle(
                                    color: AppColor.grey1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ])));
  }
}
