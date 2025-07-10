import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class Desktop5 extends StatefulWidget {
  const Desktop5({super.key});

  @override
  State<Desktop5> createState() => _Desktop5State();
}

class _Desktop5State extends State<Desktop5> {
  bool _showPlayer1 = false;
  bool _showPlayer2 = false;

  @override
  void initState() {
    super.initState();
    _registerIframes();
  }

  void _registerIframes() {
    // iframe 요소들을 Flutter 웹에 등록
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'youtube-player-1',
      (int viewId) => _createIframe('LUWbfI17_UU'),
    );

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'youtube-player-2',
      (int viewId) => _createIframe('LUWbfI17_UU'),
    );
  }

  html.IFrameElement _createIframe(String videoId) {
    final iframe = html.IFrameElement()
      ..src =
          'https://www.youtube.com/embed/$videoId?autoplay=1&controls=1&showinfo=0&rel=0&modestbranding=1'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.borderRadius = '12px'
      ..allowFullscreen = true
      ..allow = 'autoplay; encrypted-media';
    return iframe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Container(
            width: screenWidth,
            height: screenHeight,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth > 1400 ? 60 : 20,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  _buildTitleSection(screenWidth),
                  SizedBox(height: 60),
                  _buildContentCard(
                      '01',
                      '상담 요청 관리하기',
                      '상담,상담확인서 요청 확인 및 수락,거절,취소 등\n전반적인 상담 관리가 가능합니다.',
                      screenWidth,
                      1),
                  SizedBox(height: 24),
                  _buildContentCard('02', '상담 일정 관리',
                      '효율적인 상담 스케줄링과\n체계적인 상담 기록 관리가 가능합니다.', screenWidth, 2),
                  SizedBox(height: 24),
                  _buildContentCard(
                      '03',
                      '학생 진로심리검사 결과 확인',
                      '상담전,학생의 실시간 진로심리검사 내용을 확인하여\n학생별 특성을 고려하여 상담 준비가 가능합니다.',
                      screenWidth,
                      3),
                  SizedBox(height: 24),
                  _buildContentCard(
                      '04',
                      '상담 후 내용 정리',
                      '상담 후,개별 상담의 일지를 작성하고 엑셀로\n다운로드하여 유관 업무에 활용 가능합니다.',
                      screenWidth,
                      4),
                  SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitleSection(double screenWidth) {
    final titleFontSize = screenWidth > 1200
        ? 48.0
        : screenWidth > 800
            ? 36.0
            : 28.0;
    final subtitleFontSize = screenWidth > 1200
        ? 20.0
        : screenWidth > 800
            ? 18.0
            : 16.0;

    return Column(
      children: [
        Text(
          '진로상담 스케줄링부터 상담 후 행정 서류 처리까지',
          style: TextStyle(
              color: AppColor.font5,
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text('퀘스트스쿨 ',
                style: TextStyle(
                    fontSize: titleFontSize,
                    color: AppColor.font1,
                    fontWeight: FontWeight.bold)),
            Text('하나로 끝!',
                style: TextStyle(
                    fontSize: titleFontSize,
                    color: AppColor.primary,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }

  Widget _buildContentCard(String number, String title, String description,
      double screenWidth, int playerNumber) {
    final isMobile = screenWidth < 768;
    final cardWidth = screenWidth > 1400 ? 1200.0 : screenWidth * 0.9;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.all(isMobile ? 24 : 56),
      child: isMobile
          ? _buildMobileLayout(
              number, title, description, screenWidth, playerNumber)
          : _buildDesktopLayout(
              number, title, description, screenWidth, playerNumber),
    );
  }

  Widget _buildMobileLayout(String number, String title, String description,
      double screenWidth, int playerNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextContent(number, title, description, screenWidth),
        SizedBox(height: 24),
        _buildVideoSection(screenWidth, playerNumber),
      ],
    );
  }

  Widget _buildDesktopLayout(String number, String title, String description,
      double screenWidth, int playerNumber) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: screenWidth > 1200 ? 400 : 300,
            child: _buildTextContent(number, title, description, screenWidth)),
        SizedBox(width: 60),
        Flexible(child: _buildVideoSection(screenWidth, playerNumber)),
      ],
    );
  }

  Widget _buildTextContent(
      String number, String title, String description, double screenWidth) {
    final titleFontSize = screenWidth > 1200
        ? 32.0
        : screenWidth > 800
            ? 28.0
            : 24.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(number,
            style: TextStyle(
                fontSize: 20,
                color: AppColor.font1,
                fontWeight: FontWeight.w700)),
        SizedBox(height: 24),
        Text(title,
            style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        SizedBox(height: 12),
        Text(description,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.font5)),
      ],
    );
  }

  Widget _buildVideoSection(double screenWidth, int playerNumber) {
    final videoWidth = screenWidth > 1200
        ? 600.0
        : screenWidth > 800
            ? 400.0
            : screenWidth * 0.8;
    final videoHeight = videoWidth * 9 / 16;

    return Container(
      width: videoWidth,
      height: videoHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _buildVideoContent(playerNumber),
      ),
    );
  }

  Widget _buildVideoContent(int playerNumber) {
    bool showPlayer = playerNumber == 1 ? _showPlayer1 : _showPlayer2;

    if (showPlayer) {
      // 웹에서만 iframe 사용
      return HtmlElementView(
        viewType: 'youtube-player-$playerNumber',
      );
    }
    return _buildPlayButton(playerNumber);
  }

  Widget _buildPlayButton(int playerNumber) {
    const videoId = 'LUWbfI17_UU';
    const thumbnailUrl =
        'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';

    return GestureDetector(
      onTap: () {
        setState(() {
          if (playerNumber == 1) {
            _showPlayer1 = true;
          } else {
            _showPlayer2 = true;
          }
        });
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.video_library,
                        size: 60, color: Colors.grey[600]))),
            Container(color: Colors.black.withOpacity(0.3)),
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 5))
                  ],
                ),
                child: Icon(Icons.play_arrow, size: 40, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
