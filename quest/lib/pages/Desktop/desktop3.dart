import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Desktop3 extends StatelessWidget {
  const Desktop3({super.key});

  // 모바일용 카드 위젯
  Widget _buildMobileCard(String imagePath, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(imagePath),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return RepaintBoundary(
        child: Scaffold(
      backgroundColor: const Color(0xffFFF8F2),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(
              minWidth: isMobile ? 0 : 1400,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 200,
                    vertical: isMobile ? 40 : 120),
                child: isMobile
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 모바일용 텍스트 (16px)
                          Text(
                            '어려움을 한 번이라도 겪어보셨다면,',
                            style: TextStyle(
                                color: AppColor.font5,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '퀘스트스쿨',
                                style: TextStyle(
                                    color: AppColor.font1,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '이',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                ' 필요하신',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                          Text(
                            '선생님이시군요!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 40),
                          // 모바일용 박스들 (세로 배치)
                          _buildMobileCard(
                              'assets/images/i1.png',
                              '메모지, 다이어리, 컴퓨터 폴더... 여기저기',
                              '흩어져 있는 상담 기록을 찾을 때'),
                          SizedBox(height: 20),
                          _buildMobileCard('assets/images/i2.png',
                              '기록을 모아 진로 상담', '결과 보고서를 작성할 때'),
                          SizedBox(height: 20),
                          _buildMobileCard('assets/images/i3.png',
                              '갑작스러운 스케줄로 다급하게', '일정 조율이 필요할 때'),
                          SizedBox(height: 20),
                          _buildMobileCard('assets/images/i4.png',
                              '상담신청서, 상담확인서 등의', '관련 서류를 관리할 때'),
                          SizedBox(height: 20),
                          _buildMobileCard('assets/images/i5.png',
                              '동시에 많은 학생과의', '상담일정을 계획해야 할 때'),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '어려움을 한 번이라도 겪어보셨다면,',
                                style: TextStyle(
                                    color: AppColor.font5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '퀘스트스쿨',
                                    style: TextStyle(
                                        color: AppColor.font1,
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '이',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 48,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                '필요하신',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '선생님이시군요!',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 40),
                                    width: 440,
                                    height: 220,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 48,
                                            height: 48,
                                            child: Image.asset(
                                              'assets/images/i1.png',
                                            )),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '메모지, 다이어리, 컴퓨터 폴더... 여기저기',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '흩어져 있는 상담 기록을 찾을 때',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 40),
                                    width: 440,
                                    height: 220,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 48,
                                            height: 48,
                                            child: Image.asset(
                                              'assets/images/i2.png',
                                            )),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '기록을 모아 진로 상담',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '결과 보고서를 작성할 때',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 40),
                                    width: 440,
                                    height: 220,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 48,
                                            height: 48,
                                            child: Image.asset(
                                              'assets/images/i3.png',
                                            )),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '갑작스러운 스케줄로 다급하게',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '일정 조율이 필요할 때',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 40),
                                    width: 440,
                                    height: 220,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 48,
                                            height: 48,
                                            child: Image.asset(
                                              'assets/images/i4.png',
                                            )),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '상담신청서, 상담확인서 등의',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '관련 서류를 관리할 때',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 40),
                                width: 440,
                                height: 220,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 48,
                                        height: 48,
                                        child: Image.asset(
                                          'assets/images/i5.png',
                                        )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '동시에 많은 학생과의',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '상담일정을 계획해야 할 때',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
