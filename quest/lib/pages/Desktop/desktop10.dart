import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

class Desktop10 extends StatefulWidget {
  final PageController pageController; // PageController 추가

  const Desktop10({
    super.key,
    required this.pageController, // 생성자에 추가
  });

  @override
  State<Desktop10> createState() => _Desktop10State();
}

class _Desktop10State extends State<Desktop10>
    with AutomaticKeepAliveClientMixin {
  late YoutubePlayerController _controller;
  bool _isInView = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _loadVideo();
  }

  void _loadVideo() {
    _controller.loadVideoById(
      videoId: 'NMjhjrBIrG8',
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _handleVisibilityChange() {
    if (!mounted) return;

    final renderObject = context.findRenderObject();
    if (renderObject == null) return;

    final RenderBox box = renderObject as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    final screenHeight = MediaQuery.of(context).size.height;
    final isVisible =
        position.dy < screenHeight && position.dy + size.height > 0;

    if (isVisible != _isInView) {
      setState(() {
        _isInView = isVisible;
      });
      if (!isVisible) {
        _controller.pauseVideo();
      }
    }
  }

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
    super.build(context);
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        _handleVisibilityChange();
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Container(
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
                        padding: EdgeInsets.only(
                            left: 130, right: 130, bottom: 120, top: 60),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: YoutubePlayer(
                          controller: _controller,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 135, vertical: 120),
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
                                            widget.pageController.animateToPage(
                                              4, // 6번째 페이지(인덱스는 0부터 시작)
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.easeInOut,
                                            );
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
            );
          },
        ),
      ),
    );
  }
}
