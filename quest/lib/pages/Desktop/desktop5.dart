import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Desktop5 extends StatefulWidget {
  const Desktop5({super.key});

  @override
  State<Desktop5> createState() => _Desktop5State();
}

class _Desktop5State extends State<Desktop5> {
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
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth > 1400 ? 60 : 20,
              vertical: screenWidth < 768 ? 20 : 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, // 전체 컨텐츠를 화면 중앙에 배치
              children: [
                SizedBox(height: screenWidth < 768 ? 20 : 80),
                _buildTitleSection(screenWidth),
                SizedBox(height: 60),
                _buildContentCard(
                    '01',
                    '상담 요청 관리하기',
                    '상담·상담확인서 요청 확인 및 수락,거절,취소 등\n전반적인 상담 관리가 가능합니다.',
                    screenWidth,
                    'assets/video/01.mp4'),
                SizedBox(height: 24),
                _buildContentCard(
                    '02',
                    '상담 일정 관리',
                    '효율적인 상담 스케줄링과\n체계적인 상담 기록 관리가 가능합니다.',
                    screenWidth,
                    'assets/video/02.mp4'),
                SizedBox(height: 24),
                _buildContentCard(
                    '03',
                    '학생 진로심리검사 결과 확인',
                    '상담 전, 학생의 실시간 진로심리검사 내용을 확인하여\n학생별 특성을 고려한 상담 준비가 가능합니다.',
                    screenWidth,
                    'assets/video/03.mp4'),
                SizedBox(height: 24),
                _buildContentCard(
                    '04',
                    '상담 후 내용 정리',
                    '상담 후, 개별 상담의 일지를 작성하고 엑셀로\n다운로드하여 유관 업무에 활용 가능합니다.',
                    screenWidth,
                    'assets/video/04.mp4'),
                SizedBox(height: 24),
              ],
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
              fontWeight: FontWeight.w500),
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
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }

  Widget _buildContentCard(String number, String title, String description,
      double screenWidth, String videoPath) {
    final isMobile = screenWidth < 768;
    final cardWidth = screenWidth > 1400 ? 1200.0 : screenWidth * 0.9;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.all(isMobile ? 24 : 56),
      child: isMobile
          ? _buildMobileLayout(
              number, title, description, screenWidth, videoPath)
          : _buildDesktopLayout(
              number, title, description, screenWidth, videoPath),
    );
  }

  Widget _buildMobileLayout(String number, String title, String description,
      double screenWidth, String videoPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextContent(number, title, description, screenWidth),
        SizedBox(height: 24),
        _buildVideoSection(screenWidth, videoPath),
      ],
    );
  }

  Widget _buildDesktopLayout(String number, String title, String description,
      double screenWidth, String videoPath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: screenWidth > 1200 ? 400 : 300,
            child: _buildTextContent(number, title, description, screenWidth)),
        SizedBox(width: 60),
        Flexible(child: _buildVideoSection(screenWidth, videoPath)),
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

  Widget _buildVideoSection(double screenWidth, String videoPath) {
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
        child: _buildVideoOrImagePlaceholder(videoPath),
      ),
    );
  }

  Widget _buildVideoOrImagePlaceholder(String videoPath) {
    // 비디오 파일이 존재하는지 확인하는 로직
    // 실제로는 assets에 파일이 있는지 확인해야 함
    final videoNumber = videoPath.split('/').last.split('.').first;

    // 비디오 파일이 준비되면 아래 주석을 해제하고 위의 AutoPlayVideoWidget을 사용하세요
    return AutoPlayVideoWidget(url: videoPath);

    // return Container(
    //   color: Colors.grey[200],
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Icon(
    //           Icons.play_circle_outline,
    //           size: 80,
    //           color: AppColor.primary,
    //         ),
    //         SizedBox(height: 16),
    //         Text(
    //           '비디오 $videoNumber',
    //           style: TextStyle(
    //             fontSize: 18,
    //             fontWeight: FontWeight.bold,
    //             color: AppColor.font1,
    //           ),
    //         ),
    //         SizedBox(height: 8),
    //         Text(
    //           '클릭하여 재생',
    //           style: TextStyle(
    //             fontSize: 14,
    //             color: Colors.grey[600],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

// AutoPlayVideoWidget 클래스 정의
class AutoPlayVideoWidget extends StatefulWidget {
  final String url; // mp4 주소

  const AutoPlayVideoWidget({required this.url, super.key});

  @override
  State<AutoPlayVideoWidget> createState() => _AutoPlayVideoWidgetState();
}

class _AutoPlayVideoWidgetState extends State<AutoPlayVideoWidget> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _hasError = false;
  bool _isVisible = false;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    if (_isDisposed) return;

    try {
      _controller = VideoPlayerController.asset(widget.url);

      await _controller!.initialize();

      if (mounted && !_isDisposed && _controller != null) {
        await _controller!.setLooping(true);
        await _controller!.setVolume(0.0);

        setState(() {
          _isInitialized = true;
        });

        // 초기화 후 화면에 보이면 자동 재생
        if (_isVisible) {
          _playVideo();
        }
      }
    } catch (e) {
      print('Video initialization error for ${widget.url}: $e');
      if (mounted && !_isDisposed) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller?.dispose();
    super.dispose();
  }

  void _playVideo() {
    if (_isDisposed) return;

    try {
      final controller = _controller;
      if (controller != null &&
          _isInitialized &&
          !controller.value.isPlaying &&
          mounted) {
        controller.play();
        print('Playing video: ${widget.url}');
      }
    } catch (e) {
      print('Error playing video: $e');
    }
  }

  void _pauseVideo() {
    if (_isDisposed) return;

    try {
      final controller = _controller;
      if (controller != null &&
          _isInitialized &&
          controller.value.isPlaying &&
          mounted) {
        controller.pause();
        print('Pausing video: ${widget.url}');
      }
    } catch (e) {
      print('Error pausing video: $e');
    }
  }

  void _onVisibilityChanged(VisibilityInfo visibilityInfo) {
    if (_isDisposed || !mounted) return;

    final wasVisible = _isVisible;
    _isVisible = visibilityInfo.visibleFraction > 0.3; // 30% 이상 보이면 재생

    if (_isVisible && !wasVisible && _isInitialized) {
      // 화면에 나타남 - 재생
      _playVideo();
    } else if (!_isVisible && wasVisible && _isInitialized) {
      // 화면에서 사라짐 - 일시정지
      _pauseVideo();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        color: Colors.grey[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: Colors.grey[600]),
              SizedBox(height: 16),
              Text(
                '비디오를 불러올 수 없습니다',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.url,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return VisibilityDetector(
      key: Key(widget.url),
      onVisibilityChanged: _onVisibilityChanged,
      child: _isInitialized && _controller != null && !_isDisposed
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
          : Container(
              color: Colors.black12,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      '비디오 로딩 중...',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
