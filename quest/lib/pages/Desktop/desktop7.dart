import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quest/components/color.dart';

class Desktop7 extends StatefulWidget {
  const Desktop7({super.key});

  @override
  State<Desktop7> createState() => _Desktop7State();
}

class _Desktop7State extends State<Desktop7> {
  bool isTeacherSelected = false; // 학생용이 기본 선택

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildTeacherContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        children: [
          _buildFirstFeatureRow(
            'assets/images/7-4.png',
            'AI 챗봇과의 대화 혹은 학생이\n 직접 작성한 상세 내용을 통해\n학생의 상담 니즈 확인',
            '퀘스트스쿨에 상담 주제 설정을 위한 \'대화하기\' 기능이 추가되었어요! AI 챗봇과의 대화를 통해 자연스럽게 현재 학생에게 필요한 상담 주제를 찾을 수 있어요.',
          ),
          _buildFeatureRow(
            'assets/images/7-5.png',
            '적성 검사 결과 분석',
            '학생의 적성 검사 결과를 바탕으로 상담 방향을 제시합니다.',
            '다양한 적성 검사 결과를 통합 분석하여 학생의 진로 방향성을 파악하고 상담 계획을 수립합니다.',
            true,
            '두번째',
          ),
          _buildFeatureRow(
            'assets/images/7-6.png',
            '상담 일정 관리',
            '학생별 상담 일정을 체계적으로 관리하고 알림을 받을 수 있습니다.',
            '상담 예약, 변경, 취소를 한 곳에서 관리하고 학생과 학부모에게 자동으로 알림을 보냅니다.',
            true,
            '세번째',
          ),
        ],
      ),
    );
  }

  Widget _buildStudentContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        children: [
          _buildFirstFeatureRow(
            'assets/images/7-1.png',
            'AI 챗봇과의 대화를 통한 상담 내용 구체화',
            '퀘스트스쿨에 상담 주제 설정을 위한 \‘대화하기’\ 기능이 추가되었어요! AI 챗봇과의 대화를 통해 자연스럽게현재 학생에게 필요한 상담 주제를 찾을 수 있어요.',
          ),
          const SizedBox(height: 30),
          _buildFeatureRow(
            'assets/images/7-2.png',
            '직접 상담 주제 선택하고 상담 내용 작성하기 ',
            '물론, 사전 대화 없이 상담 주제를 학생이 직접 선택한 후',
            '자유롭게 상세 내용을 작성할수도 있어요.',
            true,
            '두번째',
          ),
          const SizedBox(height: 30),
          _buildFeatureRow(
            'assets/images/7-3.png',
            '진로심리검사\n실시와 요약',
            '상담 시작 전, 상담 시간을 더욱 풍성하고 실속 있게\n만들어 줄 진로심리검사를 퀘스트스쿨에서',
            '실시할 수 있어요!\n(마이페이지 메뉴, 선택사항)',
            true,
            '세번째',
          ),
        ],
      ),
    );
  }

  Widget _buildStudentTargetContainer() {
    return Container(
      width: 1200,
      height: 158,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '누가 활용하면 좋을까요?',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '상담을 해야 하긴 하는데, 선생님께 어떤 걸 여쭤봐야 할지 모르겠는 학생',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '좀 더 효율적이고 빠른 상담을 원하는 학생',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '말로 하기 어려워요! 말로 자신의 생각을 정리하기 어려운 학생',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String imagePath, String title, String description,
      String detail, bool showOrder, String orderText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(right: 20, top: 40, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 텍스트 부분 (왼쪽)
          Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showOrder) ...[
                  // 순서 텍스트
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColor.font1,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      orderText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                // 제목
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                // 설명
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),

                // 상세 설명
                Text(
                  detail,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // 이미지 부분 (오른쪽)
          Container(
            width: 624,
            height: 500,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstFeatureRow(
      String imagePath, String title, String description) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(right: 20, top: 40, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 텍스트 부분 (왼쪽)
          Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 순서 텍스트
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColor.font1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '첫번째',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // 제목
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                // 설명
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // 이미지 부분 (오른쪽)
          Container(
            width: 624,
            height: 500,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    'AI 챗봇과의 대화를 통한 상담 내용 구체화 누가 활용하면 좋은가요?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.font3),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '퀘스트스쿨 교사용 NEW 기능 안내',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColor.font1,
                    ),
                  ),
                  Text(
                    '학생 상담, 더 쉽고 정확하게!',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 48),
                  // 토글 버튼
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTeacherSelected = false;
                            });
                          },
                          child: Container(
                            width: 600,
                            height: 72,
                            decoration: BoxDecoration(
                              color: !isTeacherSelected
                                  ? AppColor.font1
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '학생용',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: !isTeacherSelected
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTeacherSelected = true;
                            });
                          },
                          child: Container(
                            width: 600,
                            height: 72,
                            decoration: BoxDecoration(
                              color: isTeacherSelected
                                  ? AppColor.font1
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '교사용',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: isTeacherSelected
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 탭에 따른 내용 변경 (선으로 연결)
                  Expanded(
                    child: Container(
                      width: 1200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: isTeacherSelected
                          ? _buildTeacherContent()
                          : _buildStudentContent(),
                    ),
                  ),
                  // 학생용일 때만 표시되는 컨테이너 (바깥에 배치)
                  if (!isTeacherSelected) ...[
                    const SizedBox(height: 30),
                    _buildStudentTargetContainer(),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
