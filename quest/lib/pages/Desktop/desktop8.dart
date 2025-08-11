import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';

class Desktop8 extends StatefulWidget {
  final ScrollController? scrollController; // ScrollController 매개변수 추가

  const Desktop8({super.key, this.scrollController});

  @override
  State<Desktop8> createState() => _Desktop8State();
}

class _Desktop8State extends State<Desktop8> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // 부모 위젯에서 ScrollController를 찾기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // PrimaryScrollController.of(context) ?? ScrollController(); // 이 부분은 제거됨
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
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
                minHeight: MediaQuery.of(context).size.height,
              ),
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 60,
                ),
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 80), // 딱 50만 띄움!
                          Expanded(
                            child: PageView(
                              controller: _pageController,
                              physics: BouncingScrollPhysics(),
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              children: [
                                _buildPageMobile1(),
                                _buildPageMobile2(),
                                _buildPageMobile3(),
                                _buildPageMobile4(),
                              ],
                            ),
                          ),
                          // 인디케이터와 네비게이션 버튼을 하나로 합치기
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // 왼쪽 화살표
                              GestureDetector(
                                onTap: _previousPage,
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: _currentPage > 0
                                      ? Colors.grey[600]
                                      : Colors.grey[300],
                                  size: 24,
                                ),
                              ),
                              // 중앙에 인디케이터
                              Row(
                                children: List.generate(4, (index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentPage == index
                                          ? AppColor.font1
                                          : Colors.grey[300],
                                    ),
                                  );
                                }),
                              ),
                              // 오른쪽 화살표
                              GestureDetector(
                                onTap: _nextPage,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: _currentPage < 3
                                      ? Colors.grey[600]
                                      : Colors.grey[300],
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _previousPage,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: _currentPage > 0
                                  ? Colors.grey[600]
                                  : Colors.grey[300],
                              size: 32,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.9, // 고정 1600 대신 화면 너비의 90%로 변경
                                child: PageView(
                                  controller: _pageController,
                                  physics: NeverScrollableScrollPhysics(),
                                  onPageChanged: (index) {
                                    setState(() {
                                      _currentPage = index;
                                    });
                                  },
                                  children: [
                                    _buildPagePC(
                                      title: '가입방법 01',
                                      subtitle: '회원 가입을 위해\n학교코드 조회하기!',
                                      desc:
                                          '학교코드란 각 학교의 고유한 식별 코드입니다.\n학교코드가 없거나 다를 경우, 회원가입이 불가하거나,\n신청한 학교 멤버를 확인할 수 없습니다.',
                                      activeStep: 0,
                                      imagePath: 'assets/images/8-1.png',
                                      buttonText: '학교코드 신청하기',
                                    ),
                                    _buildPagePC(
                                      title: '가입방법 02',
                                      subtitle:
                                          '학교코드 조회 접수 진행 후, 안내 메일 속\n학교코드 확인하고 회원가입 진행하기!',
                                      desc:
                                          '접수가 완료되면 학교코드가 기재된 안내 메일이 발송됩니다.\n학교코드를 확인하고 퀘스트스쿨에서 가입을 진행해주세요.',
                                      activeStep: 1,
                                      imagePath: 'assets/images/8-2.png',
                                    ),
                                    _buildPagePC(
                                      title: '가입방법 03',
                                      subtitle:
                                          '학교코드 입력하고 가입 절차를 마치면\n곧바로 카카오 알림톡 발송',
                                      desc:
                                          '안내 받은 학교 코드를 입력하고 회원 가입 절차를 마치면\n카카오 알림톡으로 가입신청이 완료 됐다는 연락이 갈거에요.',
                                      activeStep: 2,
                                      imagePath: 'assets/images/8-3.png',
                                    ),
                                    _buildPagePC(
                                      title: '가입방법 04',
                                      subtitle: '퀘스트스쿨 관리자의 승인 후\n최종 회원 가입 완료',
                                      desc:
                                          '승인이란 학교코드가 올바르게 연결되었는지 확인하는 단계입니다.\n회원 가입 후 24시간 내에 승인 완료되며, 승인 완료시 안내 톡이 도착합니다.',
                                      activeStep: 3,
                                      imagePath: 'assets/images/8-4.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _nextPage,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: _currentPage < 3
                                  ? Colors.grey[600]
                                  : Colors.grey[300],
                              size: 32,
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ------------------- 모바일용 페이지 빌더들 (상단 정렬) --------------------
  Widget _buildPageMobile1() => _buildMobileCommon(
        title: '가입방법 01',
        subtitle: '회원 가입을 위해\n학교코드 조회하기!',
        desc:
            '학교코드란 각 학교의 고유한 식별 코드입니다.\n학교코드가 없거나 다를 경우 회원가입이 불가하거나,\n신청한 학교 멤버를 확인할 수 없습니다.',
        step: 0,
        image: 'assets/images/8-1.png',
        button: '학교코드 신청하기',
        onButtonTap: () {
          // 스크롤로 9번 페이지로 이동 (조금 위로 올림)
          if (widget.scrollController?.hasClients == true) {
            final targetOffset = _calculateOffsetForPage(8) - 100; // 100픽셀 위로
            widget.scrollController!.animateTo(
              targetOffset,
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            );
          }
        },
      );
  Widget _buildPageMobile2() => _buildMobileCommon(
        title: '가입방법 02',
        subtitle: '학교코드 신청 후, 안내 메일 속\n학교코드 확인하고 회원가입하기!',
        desc:
            '접수가 완료되면 학교코드가 기재된 안내 메일이 발송됩니다.\n학교코드를 확인하고 퀘스트스쿨에서 가입을 진행해주세요.',
        step: 1,
        image: 'assets/images/8-2.png',
      );
  Widget _buildPageMobile3() => _buildMobileCommon(
        title: '가입방법 03',
        subtitle: '학교코드 입력하고 가입 절차를 마치면\n곧바로 카카오 알림톡 발송',
        desc:
            '안내 받은 학교코드를 입력하고 회원 가입 절차를 마치면\n카카오 알림톡으로 가입 신청이 완료되었다는 연락이 갈거에요.',
        step: 2,
        image: 'assets/images/8-3.png',
      );
  Widget _buildPageMobile4() => _buildMobileCommon(
        title: '가입방법 04',
        subtitle: '퀘스트스쿨 관리자의 승인 후\n최종 회원 가입 완료',
        desc:
            '승인이란 학교코드가 올바르게 연결되었는지 확인하는 단계입니다.\n회원 가입 후 24시간 내에 승인 완료되며,곧바로 알림톡이 도착합니다.',
        step: 3,
        image: 'assets/images/8-4.png',
      );

  // 모바일 빌더 - SingleChildScrollView 없애고, Column만 사용!
  Widget _buildMobileCommon({
    required String title,
    required String subtitle,
    required String desc,
    required int step,
    required String image,
    String? button,
    VoidCallback? onButtonTap, // 버튼 탭 콜백 추가
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final steps = ["퀘스트스쿨 학교코드 조회", "사용신청 접수", "퀘스트스쿨 회원가입", "관리자 승인"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목
        Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.font1),
        ),
        SizedBox(height: 12),
        // 소제목
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        SizedBox(height: 12),
        // 설명
        Text(
          desc,
          style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 18),
        // 버튼
        if (button != null)
          GestureDetector(
            // GestureDetector로 감싸기
            onTap: onButtonTap, // 탭 이벤트 연결
            child: Container(
              width: 200,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.font1),
              child: Center(
                child: Text(
                  button,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        if (button != null) SizedBox(height: 18),
        // 진행상황
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(steps.length, (idx) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: idx == step ? Colors.black : Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      steps[idx],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: idx == step ? Colors.black : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        // 이미지
        Container(
          width: screenWidth * 0.85,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // 특정 페이지로 스크롤하기 위한 오프셋 계산 함수 추가
  double _calculateOffsetForPage(int targetIndex) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    double offset = 0;

    for (int i = 0; i < targetIndex; i++) {
      double pageHeight = isMobile ? MediaQuery.of(context).size.height : 1080;

      if (i == 1) {
        pageHeight = isMobile ? MediaQuery.of(context).size.height * 0.5 : 1080;
      } else if (i == 2) {
        pageHeight =
            isMobile ? MediaQuery.of(context).size.height * 1.75 : 1080;
      } else if (i == 3) {
        pageHeight = isMobile ? MediaQuery.of(context).size.height * 2.1 : 1080;
      } else if (i == 4) {
        pageHeight = isMobile ? MediaQuery.of(context).size.height * 2.9 : 2400;
      } else if (i == 5) {
        pageHeight = isMobile ? MediaQuery.of(context).size.height * 1.2 : 1700;
      } else if (i == 6) {
        pageHeight = isMobile ? MediaQuery.of(context).size.height * 5.5 : 2600;
      } else if (i == 7) {
        pageHeight = isMobile ? MediaQuery.of(context).size.height * 1.4 : 1080;
      } else if (i == 8) {
        pageHeight = isMobile ? MediaQuery.of(context).size.height * 3 : 2400;
      }

      offset += pageHeight;
    }

    return offset;
  }

  // PC 버전 빌더 (기존 Row 구조 그대로, 내용만 파라미터화)
  Widget _buildPagePC({
    required String title,
    required String subtitle,
    required String desc,
    required int activeStep,
    required String imagePath,
    String? buttonText,
  }) {
    final steps = ["퀘스트스쿨 학교코드 조회", "사용신청 접수", "퀘스트스쿨 회원가입", "관리자 승인"];
    final screenWidth = MediaQuery.of(context).size.width;

    // 화면 너비에 따라 간격과 이미지 크기 조정
    double spacing = 400;
    double imageSize = 640;

    if (screenWidth < 1600) {
      spacing = 250;
      imageSize = 580;
    }
    if (screenWidth < 1400) {
      spacing = 150;
      imageSize = 540;
    }
    if (screenWidth < 1200) {
      spacing = 80;
      imageSize = 500;
    }
    if (screenWidth < 1000) {
      spacing = 30;
      imageSize = 450;
    }
    if (screenWidth < 900) {
      spacing = 10;
      imageSize = 400;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.font1),
            ),
            SizedBox(height: 24),
            Text(
              subtitle,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 24),
            Text(
              desc,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            if (buttonText != null)
              GestureDetector(
                // PC 버전도 GestureDetector로 감싸기
                onTap: () {
                  // 스크롤로 9번 페이지로 이동 (조금 위로 올림)
                  if (widget.scrollController?.hasClients == true) {
                    final targetOffset =
                        _calculateOffsetForPage(8) - 200; // 100픽셀 위로
                    widget.scrollController!.animateTo(
                      targetOffset,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Container(
                  width: 200,
                  height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.font1),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            if (buttonText != null) SizedBox(height: 200),
            if (buttonText == null) SizedBox(height: 200 + 54),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(steps.length, (idx) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: idx == activeStep
                              ? Colors.black
                              : Colors.grey[600],
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        steps[idx],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: idx == activeStep
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: idx == activeStep
                              ? Colors.black
                              : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
        SizedBox(width: spacing), // 반응형 간격 적용
        Container(
          width: imageSize, // 반응형 이미지 크기 적용
          height: imageSize, // 반응형 이미지 크기 적용
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
