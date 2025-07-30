import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest/widget/review.dart';

class Desktop8 extends StatefulWidget {
  const Desktop8({super.key});

  @override
  State<Desktop8> createState() => _Desktop8State();
}

class _Desktop8State extends State<Desktop8> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

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
                  child: Center(
                      child: isMobile
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // 페이지뷰
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: PageView(
                                      controller: _pageController,
                                      physics: isMobile
                                          ? BouncingScrollPhysics()
                                          : NeverScrollableScrollPhysics(),
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentPage = index;
                                        });
                                      },
                                      children: [
                                        _buildPage1(),
                                        _buildPage2(),
                                        _buildPage3(),
                                        _buildPage4(),
                                      ],
                                    ),
                                  ),
                                ),
                                // 페이지 인디케이터
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(4, (index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _currentPage == index
                                              ? AppColor.font1
                                              : Colors.grey[300],
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                // 네비게이션 버튼
                                Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // 이전 페이지 아이콘
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

                                // 페이지뷰
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      width: 1600,
                                      child: PageView(
                                        controller: _pageController,
                                        physics: NeverScrollableScrollPhysics(),
                                        onPageChanged: (index) {
                                          setState(() {
                                            _currentPage = index;
                                          });
                                        },
                                        children: [
                                          _buildPage1(),
                                          _buildPage2(),
                                          _buildPage3(),
                                          _buildPage4(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // 다음 페이지 아이콘
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
                            ))));
        },
      ),
    ));
  }

  // 첫 번째 페이지 (기존 내용)
  Widget _buildPage1() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Center(
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '가입방법 01',
                  style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w500,
                      color: AppColor.font1),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  '회원 가입을 위해\n학교 코드 조회하기!',
                  style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  '학교 코드란 각 학교의 고유한 식별 코드입니다.\n학교 코드가 없거나 다를 경우 회원가입이 불가하거나,\n신청한 학교 멤버 확인불가합니다.',
                  style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 24 : 40),
                Container(
                  width: isMobile ? 180 : 200,
                  height: isMobile ? 44 : 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.font1),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Center(
                    child: Text(
                      '학교 코드 조회하기',
                      style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 30 : 200),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '퀘스트스쿨 학교 코드 조회',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '사용신청 접수',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '퀘스트스쿨 회원가입',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '관리자 승인',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 30 : 0),
                Container(
                  width: isMobile ? screenWidth * 0.8 : 640,
                  height: isMobile ? 300 : 640,
                  child: Image.asset('assets/images/8-1.png'),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '가입방법 01',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.font1),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '회원 가입을 위해\n학교 코드 조회하기!',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '학교 코드란 각 학교의 고유한 식별 코드입니다.\n학교 코드가 없거나 다를 경우, 회원가입이 불가하거나,\n신청한 학교 멤버를 확인할 수 없습니다.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 200,
                      height: 54,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.font1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      child: Center(
                        child: Text(
                          '학교 코드 조회하기',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 200),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트스쿨 학교 코드 조회',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '사용신청 접수',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트스쿨 회원가입',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '관리자 승인',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 400),
                Container(
                  width: 640,
                  height: 640,
                  child: Image.asset('assets/images/8-1.png'),
                ),
              ],
            ),
    );
  }

  // 두 번째 페이지
  Widget _buildPage2() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Center(
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '가입방법 02',
                  style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w500,
                      color: AppColor.font1),
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  '학교 코드 조회 접수 후, 안내 메일 속\n학교코드 확인하고 회원가입 진행하기!',
                  style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  '접수가 완료되면 학교 코드가 기재된 안내 메일이 발송됩니다.\n학교코드를 확인하고 퀘스트스쿨에서 가입을 진행해주세요.',
                  style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 30 : 200),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '퀘스트스쿨 학교 코드 조회',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '사용신청 접수',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '퀘스트스쿨 회원가입',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '관리자 승인',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 30 : 0),
                Container(
                  width: isMobile ? screenWidth * 0.8 : 640,
                  height: isMobile ? 300 : 640,
                  child: Image.asset('assets/images/8-2.png'),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '가입방법 02',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.font1),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '학교 코드 조회 접수 진행 후,\n학교 코드 및 사용 안내 메일 발송',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '접수가 진행되면 학교 코드와 안내 메일이 00분 내로 발송됩니다.\n메일을 확인해 주세요.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 200),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트스쿨 학교 코드 조회',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '사용신청 접수',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트스쿨 회원가입',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '관리자 승인',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 400),
                Container(
                  width: 640,
                  height: 640,
                  child: Image.asset('assets/images/8-2.png'),
                ),
              ],
            ),
    );
  }

  // 세 번째 페이지
  Widget _buildPage3() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Center(
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '가입방법 03',
                  style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w500,
                      color: AppColor.font1),
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  '학교 코드 입력하고 가입 절차를 마치면\n곧바로 카카오 알림톡 발송',
                  style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  '안내 받은 학교 코드를 입력하고 회원 가입 절차를 마치면\n카카오 알림톡으로 가입 신청이 완료되었다는 연락이 갈거에요.',
                  style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 30 : 200),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '퀘스트스쿨 학교 코드 조회',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '사용신청 접수',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '퀘스트스쿨 회원가입',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '관리자 승인',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 30 : 0),
                Container(
                  width: isMobile ? screenWidth * 0.8 : 640,
                  height: isMobile ? 300 : 640,
                  child: Image.asset('assets/images/8-3.png'),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '가입방법 03',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.font1),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '회원 가입 후 안내 받은 학교 코드를\n입력하면 카카오 알림톡 발송',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '퀘스트스쿨 회원가입 후에 안내 받은 학교 코드를 입력하면\n카카오 알림톡으로 가입신청이 완료 됐다는 연락이 갈거에요.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 200),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트스쿨 학교 코드 조회',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '사용신청 접수',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트스쿨 회원가입',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '관리자 승인',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 400),
                Container(
                  width: 640,
                  height: 640,
                  child: Image.asset('assets/images/8-3.png'),
                ),
              ],
            ),
    );
  }

  // 네 번째 페이지
  Widget _buildPage4() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Center(
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '가입방법 04',
                  style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w500,
                      color: AppColor.font1),
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  '퀘스트스쿨 관리자의 승인 후\n최종 회원 가입 완료',
                  style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Text(
                  '승인이란 학교 코드가 올바르게 연결되었는지 확인하는 단계입니다.\n회원 가입 후 24시간 내에 승인 완료되며, 승인 완료시 안내 톡이 도착합니다.',
                  style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500),
                  textAlign: isMobile ? TextAlign.left : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 30 : 200),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '퀘스트스쿨 학교 코드 조회',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '사용신청 접수',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '퀘스트스쿨 회원가입',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '관리자 승인',
                          style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 30 : 0),
                Container(
                  width: isMobile ? screenWidth * 0.8 : 640,
                  height: isMobile ? 300 : 640,
                  child: Image.asset('assets/images/8-4.png'),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '가입방법 04',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.font1),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '퀘스트스쿨 관리자의 승인 후\n최종 회원 가입 완료',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 24),
                    Text(
                      '승인이란 학교 코드가 올바르게 연결되었는지 확인하는 단계입니다.\n회원 가입 후 24시간 내에 승인 완료되며, 승인 완료시 안내 톡이 도착합니다.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 200),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트스쿨 학교 코드 조회',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '사용신청 접수',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '퀘스트스쿨 회원가입',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              '관리자 승인',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 400),
                Container(
                  width: 640,
                  height: 640,
                  child: Image.asset('assets/images/8-4.png'),
                ),
              ],
            ),
    );
  }
}
