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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 50, vertical: isMobile ? 10 : 20),
      child: Column(
        children: [
          _buildFirstFeatureRow(
            'assets/images/7-4.png',
            'AI 챗봇과의 대화 혹은 학생이\n 직접 작성한 상세 내용을 통해\n학생의 상담 니즈 확인',
            '학생이 남긴 대화 내역 혹은 직접 작성한 상세 내용을 통해,\n상담 전 학생이 원하는 상담 주제를 확인할 수 있어요!',
          ),
          SizedBox(height: isMobile ? 20 : 30),
          _buildFeatureRow(
            'assets/images/7-5.png',
            '진로심리검사 실시 결과\n확인을 통한 학생의 특성 파악',
            '학생이 남긴 진로심리검사 결과를 통해,',
            '상담 전 학생의 특성을 고려하여 상담 준비를 할 수 있어요!',
            true,
            '두번째',
          ),
          SizedBox(height: isMobile ? 20 : 30),
          _buildFeatureRow(
            'assets/images/7-6.png',
            '상담 후 상담 내용 기록과\n해당 내용 요약본을 엑셀로 다운로드',
            '상담 내용을 기록하고, 주요 키워드를 중심으로 한 줄',
            '요약하여 상담 기록을 더욱 쉽게 찾아보세요!',
            true,
            '세번째',
          ),
        ],
      ),
    );
  }

  Widget _buildStudentContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 50, vertical: isMobile ? 10 : 20),
      child: Column(
        children: [
          _buildFirstFeatureRow(
            'assets/images/7-1.png',
            'AI 챗봇과의 대화를 통한 상담 내용 구체화',
            '퀘스트스쿨에 상담 주제 설정을 위한 \'대화하기\' 기능이 추가되었어요! AI 챗봇과의 대화를 통해 자연스럽게현재 학생에게 필요한 상담 주제를 찾을 수 있어요.',
          ),
          SizedBox(height: isMobile ? 20 : 30),
          _buildFeatureRow(
            'assets/images/7-2.png',
            '직접 상담 주제 선택하고 상담 내용 작성하기 ',
            '물론, 사전 대화 없이 상담 주제를 학생이 직접 선택한 후',
            '자유롭게 상세 내용을 작성할수도 있어요.',
            true,
            '두번째',
          ),
          SizedBox(height: isMobile ? 20 : 30),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: isMobile ? screenWidth * 0.9 : 1200,
      height: isMobile ? 120 : 158,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(isMobile ? 8 : 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isMobile ? 15 : 20),
          Padding(
            padding: EdgeInsets.only(left: isMobile ? 15 : 20),
            child: Text(
              '누가 활용하면 좋을까요?',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 10 : 15),
          Padding(
            padding: EdgeInsets.only(left: isMobile ? 15 : 20),
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
                    SizedBox(width: isMobile ? 8 : 10),
                    Expanded(
                      child: Text(
                        '상담을 해야 하긴 하는데, 선생님께 어떤 걸 여쭤봐야 할지 모르겠는 학생',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 6 : 8),
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
                    SizedBox(width: isMobile ? 8 : 10),
                    Expanded(
                      child: Text(
                        '좀 더 효율적이고 빠른 상담을 원하는 학생',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 6 : 8),
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
                    SizedBox(width: isMobile ? 8 : 10),
                    Expanded(
                      child: Text(
                        '말로 하기 어려워요! 말로 자신의 생각을 정리하기 어려운 학생',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.grey,
                        ),
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

  Widget _buildTeacherTargetContainer() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: isMobile ? screenWidth * 0.9 : 1200,
      height: isMobile ? 120 : 158,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(isMobile ? 8 : 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isMobile ? 15 : 20),
          Padding(
            padding: EdgeInsets.only(left: isMobile ? 15 : 20),
            child: Text(
              '누가 활용하면 좋을까요?',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 10 : 15),
          Padding(
            padding: EdgeInsets.only(left: isMobile ? 15 : 20),
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
                    SizedBox(width: isMobile ? 8 : 10),
                    Expanded(
                      child: Text(
                        '상담 시 학생이 원하는 것과 반드시 다루어야 할 상담 주제 등을 정확히 파악하고 싶은 선생님',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 6 : 8),
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
                    SizedBox(width: isMobile ? 8 : 10),
                    Expanded(
                      child: Text(
                        '학생의 생각이 어떻게 전개되는지 알고 싶은 선생님',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 6 : 8),
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
                    SizedBox(width: isMobile ? 8 : 10),
                    Expanded(
                      child: Text(
                        '자주 깜빡깜빡해요! 학생들의 지난 상담 내용을 일일이 기억하기 어려운 선생님',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.grey,
                        ),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          right: isMobile ? 10 : 20,
          top: isMobile ? 20 : 40,
          bottom: isMobile ? 20 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 20 : 40),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showOrder) ...[
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 12 : 16,
                        vertical: isMobile ? 6 : 8),
                    decoration: BoxDecoration(
                      color: AppColor.font1,
                      borderRadius: BorderRadius.circular(isMobile ? 15 : 20),
                    ),
                    child: Text(
                      orderText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 20),
                ],
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: isMobile ? 12 : 16),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: isMobile ? 20 : 0),
                Container(
                  width: isMobile ? screenWidth * 0.8 : 624,
                  height: isMobile ? 300 : 500,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showOrder) ...[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 12 : 16,
                              vertical: isMobile ? 6 : 8),
                          decoration: BoxDecoration(
                            color: AppColor.font1,
                            borderRadius:
                                BorderRadius.circular(isMobile ? 15 : 20),
                          ),
                          child: Text(
                            orderText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 12 : 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: isMobile ? 12 : 20),
                      ],
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        detail,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          right: isMobile ? 10 : 20,
          top: isMobile ? 20 : 40,
          bottom: isMobile ? 20 : 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 20 : 40),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 12 : 16,
                      vertical: isMobile ? 6 : 8),
                  decoration: BoxDecoration(
                    color: AppColor.font1,
                    borderRadius: BorderRadius.circular(isMobile ? 15 : 20),
                  ),
                  child: Text(
                    '첫번째',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 12 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 12 : 20),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: isMobile ? 20 : 0),
                Container(
                  width: isMobile ? screenWidth * 0.8 : 624,
                  height: isMobile ? 300 : 500,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 12 : 16,
                            vertical: isMobile ? 6 : 8),
                        decoration: BoxDecoration(
                          color: AppColor.font1,
                          borderRadius:
                              BorderRadius.circular(isMobile ? 15 : 20),
                        ),
                        child: Text(
                          '첫번째',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 12 : 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 20),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return RepaintBoundary(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: EdgeInsets.only(
                top: isMobile ? 40 : 120,
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
                        fontSize: isMobile ? 14 : 20,
                        fontWeight: FontWeight.w500,
                        color: AppColor.font3),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                  SizedBox(
                    height: isMobile ? 8 : 12,
                  ),
                  Text(
                    '퀘스트스쿨 교사용 NEW 기능 안내',
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 48,
                      fontWeight: FontWeight.w500,
                      color: AppColor.font1,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                  Text(
                    '학생 상담, 더 쉽고 정확하게!',
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 48,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                  SizedBox(height: isMobile ? 24 : 48),
                  // 토글 버튼
                  Container(
                    width: isMobile
                        ? screenWidth * 0.9
                        : MediaQuery.of(context).size.width,
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
                            width: isMobile ? (screenWidth * 0.9) / 2 : 600,
                            height: isMobile ? 50 : 72,
                            decoration: BoxDecoration(
                              color: !isTeacherSelected
                                  ? AppColor.font1
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(isMobile ? 15 : 20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '학생용',
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 24,
                                  fontWeight: FontWeight.w500,
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
                            width: isMobile ? (screenWidth * 0.9) / 2 : 600,
                            height: isMobile ? 50 : 72,
                            decoration: BoxDecoration(
                              color: isTeacherSelected
                                  ? AppColor.font1
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(isMobile ? 15 : 20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '교사용',
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 24,
                                  fontWeight: FontWeight.w500,
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
                      width: isMobile ? screenWidth * 0.9 : 1200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(isMobile ? 15 : 20),
                          bottomRight: Radius.circular(isMobile ? 15 : 20),
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
                  // 탭에 따른 대상자 컨테이너 (바깥에 배치)
                  SizedBox(height: isMobile ? 20 : 30),
                  isTeacherSelected
                      ? _buildTeacherTargetContainer()
                      : _buildStudentTargetContainer(),
                  SizedBox(height: isMobile ? 20 : 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
