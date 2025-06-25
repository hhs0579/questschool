import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

class Desktop2 extends StatefulWidget {
  final PageController pageController;

  const Desktop2({
    super.key,
    required this.pageController,
  });

  @override
  State<Desktop2> createState() => _Desktop2State();
}

class _Desktop2State extends State<Desktop2>
    with AutomaticKeepAliveClientMixin {
  late YoutubePlayerController _controller;
  bool _isInView = true;
  bool _isLoading = false;
  bool _hasError = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
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
    try {
      _controller.loadVideoById(
        videoId: 'LUWbfI17_UU',
      );

      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
      print('비디오 로딩 오류: $e');
    }
  }

  @override
  void dispose() {
    try {
      _controller.close();
    } catch (e) {
      print('Controller dispose 오류: $e');
    }
    super.dispose();
  }

  void _handleVisibilityChange() {
    if (!mounted) return;

    try {
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
        if (!isVisible && !_hasError) {
          _controller.pauseVideo();
        }
      }
    } catch (e) {
      print('Visibility 체크 오류: $e');
    }
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
    super.build(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        _handleVisibilityChange();
        return true;
      },
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
              height: screenHeight, // 화면 높이에 정확히 맞춤
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

                  // 유튜브 플레이어 컨테이너 - Expanded로 남은 공간 차지
                  Expanded(
                    child: Container(
                      padding: responsivePadding,
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 1200, // 최대 너비 제한
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
                          child: _buildVideoPlayer(),
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

  Widget _buildVideoPlayer() {
    if (_hasError) {
      return _buildErrorWidget();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // 사용 가능한 공간 계산
        final availableWidth = constraints.maxWidth;
        final availableHeight = constraints.maxHeight;

        // 16:9 비율로 계산했을 때의 크기
        final videoWidth = availableWidth;
        final videoHeight = videoWidth * 9 / 16;

        // 높이가 넘치면 높이 기준으로 계산
        if (videoHeight > availableHeight) {
          final adjustedHeight = availableHeight;
          final adjustedWidth = adjustedHeight * 16 / 9;

          return Center(
            child: SizedBox(
              width: adjustedWidth,
              height: adjustedHeight,
              child: YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
          );
        }

        // 기본 AspectRatio 사용
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
        );
      },
    );
  }

  Widget _buildLoadingWidget() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.black12,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                '비디오 로딩 중...',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: Colors.grey[100],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Colors.grey[600],
                ),
                const SizedBox(height: 16),
                Text(
                  '비디오를 불러올 수 없습니다',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _loadVideo();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.font1,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('다시 시도'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
