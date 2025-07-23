import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

// 웹용
import 'dart:html' as html;
import 'dart:ui' as ui;

class Desktop2 extends StatefulWidget {
  const Desktop2({super.key});

  @override
  State<Desktop2> createState() => _Desktop2State();
}

class _Desktop2State extends State<Desktop2>
    with AutomaticKeepAliveClientMixin {
  bool _showPlayer = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _registerIframe();
    }
  }

  void _registerIframe() {
    try {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        'youtube-player-desktop2',
        (int viewId) => _createIframe('LUWbfI17_UU'),
      );
    } catch (e) {
      print('iframe 등록 실패: $e');
    }
  }

  html.IFrameElement _createIframe(String videoId) {
    final iframe = html.IFrameElement()
      ..src =
          'https://www.youtube.com/embed/$videoId?autoplay=1&controls=1&showinfo=0&rel=0&modestbranding=1&iv_load_policy=3'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.borderRadius = '20px'
      ..allowFullscreen = true
      ..allow = 'autoplay; encrypted-media; fullscreen';
    return iframe;
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

  // 반응형 패딩 계산
  EdgeInsets _getResponsivePadding(double screenWidth) {
    if (screenWidth > 1400) {
      return const EdgeInsets.symmetric(horizontal: 130, vertical: 60);
    } else if (screenWidth > 1200) {
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 50);
    } else if (screenWidth > 900) {
      return const EdgeInsets.symmetric(horizontal: 50, vertical: 40);
    } else if (screenWidth > 600) {
      return const EdgeInsets.symmetric(horizontal: 30, vertical: 30);
    } else {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
    }
  }

  // 반응형 border radius 계산
  double _getResponsiveBorderRadius(double screenWidth) {
    if (screenWidth > 1200) {
      return 20.0;
    } else if (screenWidth > 900) {
      return 16.0;
    } else if (screenWidth > 600) {
      return 12.0;
    } else {
      return 8.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = MediaQuery.of(context).size.width;
            final screenHeight = MediaQuery.of(context).size.height;
            final responsivePadding = _getResponsivePadding(screenWidth);
            final borderRadius = _getResponsiveBorderRadius(screenWidth);

            return Container(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                children: [
                  // 상단 제목
                  Container(
                    padding: const EdgeInsets.only(top: 60, bottom: 20),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: screenWidth > 600 ? 36 : 28,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '퀘스트스쿨',
                            style: TextStyle(color: AppColor.font1),
                          ),
                          const TextSpan(text: '의 홍보용 영상'),
                        ],
                      ),
                    ),
                  ),

                  // 비디오 컨테이너
                  Expanded(
                    child: Container(
                      padding: responsivePadding,
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                            maxWidth: 1200,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(borderRadius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: _buildVideoContent(),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 하단 여백
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoContent() {
    if (_showPlayer) {
      return _buildVideoPlayer();
    }
    return _buildPlayButton();
  }

  Widget _buildVideoPlayer() {
    if (kIsWeb) {
      // 웹: iframe으로 페이지 내 재생
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: HtmlElementView(
            viewType: 'youtube-player-desktop2',
          ),
        ),
      );
    } else {
      // 모바일: YouTube 앱으로 이동 안내
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.smart_display, size: 60, color: Colors.white70),
                SizedBox(height: 16),
                Text(
                  '모바일에서는 YouTube 앱에서\n시청하실 수 있습니다',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () =>
                      _launchURL('https://www.youtube.com/watch?v=LUWbfI17_UU'),
                  icon: Icon(Icons.open_in_new),
                  label: Text('YouTube에서 보기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildPlayButton() {
    const videoId = 'LUWbfI17_UU';
    const thumbnailUrl =
        'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';

    return GestureDetector(
      onTap: () {
        setState(() {
          _showPlayer = true;
        });
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 실제 YouTube 썸네일
              Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColor.font1),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  // 썸네일 로드 실패 시 대체 이미지
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColor.font1.withOpacity(0.3),
                          AppColor.primary.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.video_library,
                            size: 60,
                            color: Colors.white70,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '퀘스트스쿨 홍보 영상',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              // 어둠 오버레이 (재생 버튼 가시성을 위해)
              Container(
                color: Colors.black.withOpacity(0.3),
              ),

              // 중앙 플레이 버튼
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
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),

              // 하단 제목 오버레이
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '퀘스트스쿨 홍보 영상',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        kIsWeb ? '클릭하여 이 페이지에서 재생하기' : '클릭하여 YouTube 앱에서 보기',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // YouTube 라벨
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_circle_outline,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'YouTube',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 호버 효과
              MouseRegion(
                onEnter: (_) {},
                onExit: (_) {},
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
