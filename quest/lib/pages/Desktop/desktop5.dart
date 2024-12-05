import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest/widget/video.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Desktop5 extends StatefulWidget {
  const Desktop5({super.key});

  @override
  State<Desktop5> createState() => _Desktop5State();
}

class _Desktop5State extends State<Desktop5> {
  // 동영상 팝업을 보여주는 함수

  late YoutubePlayerController _controller;
  bool a = true;
  bool b = false;
  bool c = false;
  bool d = false;
  @override
  void initState() {
    super.initState();
    // 컨트롤러 초기화
    _controller = YoutubePlayerController.fromVideoId(
      videoId: 'NMjhjrBIrG8', // 실제 유튜브 비디오 ID로 교체
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  // 다이얼로그 표시 함수
  void _showVideoDialog(BuildContext context) async {
    // 다이얼로그를 보여주기 전에 컨트롤러 재초기화
    _controller = YoutubePlayerController.fromVideoId(
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
        return PopScope(
          onPopInvoked: (didPop) {
            if (didPop) {
              _controller.stopVideo();
            }
          },
          child: VideoDialog(controller: _controller),
        );
      },
    );

    // 다이얼로그가 닫힐 때 컨트롤러 정리
    _controller.stopVideo();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
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
                                    style: TextStyle(color: AppColor.font1)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffDFDFDF)),
                                          borderRadius:
                                              BorderRadius.circular(99),
                                          color: AppColor.font1,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColor.font1
                                                  .withOpacity(0.4),
                                              spreadRadius: 5,
                                              blurRadius: 4,
                                              offset: const Offset(0, 0),
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
                                                const EdgeInsets.only(top: 8),
                                            height: 5,
                                            width: 5,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff414042),
                                                borderRadius:
                                                    BorderRadius.circular(99)),
                                          ),
                                          const SizedBox(width: 5),
                                          const Text.rich(
                                            TextSpan(
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Color(0xff414042)),
                                              children: [
                                                TextSpan(
                                                    text: '상담·상담확인서 요청 확인 및\n'),
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
                                  const SizedBox(
                                    width: 93.5,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xffDFDFDF)),
                                            borderRadius:
                                                BorderRadius.circular(99),
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
                                  const SizedBox(
                                    width: 150,
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
                                  )
                                ],
                              )
                      ]),
                )
              ]));
        },
      ),
    );
  }
}
