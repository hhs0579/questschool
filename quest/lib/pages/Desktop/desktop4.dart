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
    return RepaintBoundary(
        child: Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.only(
              top: 120,
            ),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '교내 진로진학 상담을 간편하고 신속하게!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.font5),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '이제 ',
                      style: TextStyle(
                          fontSize: 48,
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '퀘스트스쿨',
                      style: TextStyle(
                          fontSize: 48,
                          color: AppColor.font1,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '이 ',
                      style: TextStyle(
                          fontSize: 48,
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '도와드릴게요! ',
                      style: TextStyle(
                          fontSize: 48,
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 400,
                      width: 385,
                      padding: EdgeInsets.only(
                          top: 40, bottom: 40, left: 36, right: 36),
                      decoration: BoxDecoration(
                          color: Color(0xffEEF9EF),
                          borderRadius: BorderRadius.circular(16)),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 144,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Color(0xff55C45B),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Center(
                                    child: Text(
                                  'WORK EFFICIENCY',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                '업무 효율성',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                '일정 관리부터 상담 기록까지 퀘스트스쿨로!',
                                style: TextStyle(
                                    color: AppColor.font5, fontSize: 16),
                              ),
                              Text(
                                '상담 기록은 엑셀로 다운로드 가능합니다',
                                style: TextStyle(
                                    color: AppColor.font5, fontSize: 16),
                              )
                            ],
                          ),
                          // 아이콘을 오른쪽 아래에 배치
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 120,
                              height: 120,
                              child: Image.asset('assets/images/i6.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 48,
                    ),
                    Container(
                      height: 400,
                      width: 385,
                      padding: EdgeInsets.only(
                          top: 40, bottom: 40, left: 36, right: 36),
                      decoration: BoxDecoration(
                          color: Color(0xffFFFCE5),
                          borderRadius: BorderRadius.circular(16)),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 190,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Color(0xffFEE500),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Center(
                                    child: Text(
                                  'Real-time Notification',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                '실시간 알림',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                '상담 신청과 승인 알림이 카카오 알림톡으로',
                                style: TextStyle(
                                    color: AppColor.font5, fontSize: 16),
                              ),
                              Text(
                                '전달되어 신속한 스케줄링이 가능합니다.',
                                style: TextStyle(
                                    color: AppColor.font5, fontSize: 16),
                              )
                            ],
                          ),
                          // 아이콘을 오른쪽 아래에 배치
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 120,
                              height: 120,
                              child: Image.asset('assets/images/i7.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 48,
                    ),
                    Container(
                      height: 400,
                      width: 385,
                      padding: EdgeInsets.only(
                          top: 40, bottom: 40, left: 36, right: 36),
                      decoration: BoxDecoration(
                          color: Color(0xffEEFAFF),
                          borderRadius: BorderRadius.circular(16)),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 95,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Color(0xff55D2FF),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Center(
                                    child: Text(
                                  'SAFE DATA',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                '데이터는 안전하게',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                '국제적으로 가장 권위있는 개인 정보 보호,',
                                style: TextStyle(
                                    color: AppColor.font5, fontSize: 16),
                              ),
                              Text(
                                '정보 보안 ISO 27001 인증을 획득했습니다.',
                                style: TextStyle(
                                    color: AppColor.font5, fontSize: 16),
                              )
                            ],
                          ),
                          // 아이콘을 오른쪽 아래에 배치
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 120,
                              height: 120,
                              child: Image.asset('assets/images/i8.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 56,
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
