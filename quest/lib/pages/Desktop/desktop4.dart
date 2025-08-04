import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Desktop4 extends StatefulWidget {
  const Desktop4({super.key});

  @override
  State<Desktop4> createState() => _Desktop4State();
}

class _Desktop4State extends State<Desktop4>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = MediaQuery.of(context).size.width;
          final isMobile = screenWidth < 768;
          return Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              width: MediaQuery.of(context).size.width * 0.98,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      '교내 진로진학 상담을 간편하고 신속하게!',
                      style: TextStyle(
                          fontSize: isMobile ? 16 : 20,
                          fontWeight: FontWeight.w500,
                          color: AppColor.font5),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    RichText(
                      textAlign: isMobile ? TextAlign.center : TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '이제 ',
                            style: TextStyle(
                              fontSize: isMobile ? 25 : 48,
                              color: AppColor.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '퀘스트스쿨',
                            style: TextStyle(
                              fontSize: isMobile ? 25 : 48,
                              color: AppColor.font1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '이 ',
                            style: TextStyle(
                              fontSize: isMobile ? 25 : 48,
                              color: AppColor.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '도와드릴게요!',
                            style: TextStyle(
                              fontSize: isMobile ? 25 : 48,
                              color: AppColor.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? 32 : 55,
                    ),
                    isMobile
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                _buildDesktopCard(
                                  color: Color(0xffEEF9EF),
                                  label: 'WORK EFFICIENCY',
                                  labelColor: Colors.white,
                                  labelBg: Color(0xff55C45B),
                                  title: '업무 효율성',
                                  desc1: '일정 관리부터 상담 기록까지 퀘스트스쿨로!',
                                  desc2: '상담 기록은 엑셀로 다운로드 가능합니다',
                                  image: 'assets/images/i6.png',
                                ),
                                SizedBox(height: 24),
                                _buildDesktopCard(
                                  color: Color(0xffFFFCE5),
                                  label: 'Real-time Notification',
                                  labelColor: Colors.black,
                                  labelBg: Color(0xffFEE500),
                                  title: '실시간 알림',
                                  desc1: '상담 신청과 승인 알림이 카카오 알림톡으로',
                                  desc2: '전달되어 신속한 스케줄링이 가능합니다.',
                                  image: 'assets/images/i7.png',
                                ),
                                SizedBox(height: 24),
                                _buildDesktopCard(
                                  color: Color(0xffEEFAFF),
                                  label: 'SAFE DATA',
                                  labelColor: Colors.white,
                                  labelBg: Color(0xff55D2FF),
                                  title: '데이터는 안전하게',
                                  desc1: '국제적으로 가장 권위있는 개인 정보 보호,',
                                  desc2: '정보 보안 ISO 27001 인증을 획득했습니다.',
                                  image: 'assets/images/i8.png',
                                ),
                              ],
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildDesktopCard(
                                color: Color(0xffEEF9EF),
                                label: 'WORK EFFICIENCY',
                                labelColor: Colors.white,
                                labelBg: Color(0xff55C45B),
                                title: '업무 효율성',
                                desc1: '일정 관리부터 상담 기록까지 퀘스트스쿨로!',
                                desc2: '상담 기록은 엑셀로 다운로드 가능합니다',
                                image: 'assets/images/i6.png',
                              ),
                              SizedBox(width: 48),
                              _buildDesktopCard(
                                color: Color(0xffFFFCE5),
                                label: 'Real-time Notification',
                                labelColor: Colors.black,
                                labelBg: Color(0xffFEE500),
                                title: '실시간 알림',
                                desc1: '상담 신청과 승인 알림이 카카오 알림톡으로',
                                desc2: '전달되어 신속한 스케줄링이 가능합니다.',
                                image: 'assets/images/i7.png',
                              ),
                              SizedBox(width: 48),
                              _buildDesktopCard(
                                color: Color(0xffEEFAFF),
                                label: 'SAFE DATA',
                                labelColor: Colors.white,
                                labelBg: Color(0xff55D2FF),
                                title: '데이터는 안전하게',
                                desc1: '국제적으로 가장 권위있는 개인 정보 보호,',
                                desc2: '정보 보안 ISO 27001 인증을 획득했습니다.',
                                image: 'assets/images/i8.png',
                              ),
                            ],
                          ),
                    SizedBox(
                      height: isMobile ? 40 : 56,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget _buildMobileCard({
    required Color color,
    required String label,
    required Color labelColor,
    required Color labelBg,
    required String title,
    required String desc1,
    required String desc2,
    required String image,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 32,
                decoration: BoxDecoration(
                  color: labelBg,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: labelColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                desc1,
                style: TextStyle(
                  color: AppColor.font5,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                desc2,
                style: TextStyle(
                  color: AppColor.font5,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 80,
              height: 80,
              child: Image.asset(
                image,
                cacheWidth: 160,
                cacheHeight: 160,
                filterQuality: FilterQuality.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopCard({
    required Color color,
    required String label,
    required Color labelColor,
    required Color labelBg,
    required String title,
    required String desc1,
    required String desc2,
    required String image,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    // Real-time Notification 라벨의 경우 모바일에서 더 긴 width 적용
    double labelWidth = 144;
    if (label == 'Real-time Notification' && isMobile) {
      labelWidth = 200;
    } else if (label == 'Real-time Notification') {
      labelWidth = 190;
    } else if (label == 'SAFE DATA') {
      labelWidth = 95;
    }

    return Container(
      height: 400,
      width: 385,
      padding: EdgeInsets.only(top: 40, bottom: 40, left: 36, right: 36),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: labelWidth,
                height: 32,
                decoration: BoxDecoration(
                  color: labelBg,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: labelColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
              SizedBox(height: 12),
              Text(
                desc1,
                style: TextStyle(
                  color: AppColor.font5,
                  fontSize: 16,
                ),
              ),
              Text(
                desc2,
                style: TextStyle(
                  color: AppColor.font5,
                  fontSize: 16,
                  fontWeight: label == 'SAFE DATA'
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 120,
              height: 120,
              child: Image.asset(
                image,
                cacheWidth: 240,
                cacheHeight: 240,
                filterQuality: FilterQuality.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
