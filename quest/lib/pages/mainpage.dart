import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/screensized.dart';
import 'package:flutter_svg/flutter_svg.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: const SingleChildScrollView(),
        desktop: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                // 최소 높이를 화면 높이로 설정
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/desk1.png'),
                    fit: BoxFit.cover,
                    // 이미지가 컨테이너를 벗어나지 않도록 설정
                    alignment: Alignment.center,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 89,
                    ),
                    Container(
                      width: 259,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: const Center(
                        child: Text(
                          '상담 스케줄링이 이렇게 쉽다고?',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.font1,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      '교내 진로진학 상담 솔루션',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 36),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: 304,
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '퀘스트스쿨은 PC(교사용)와 모바일(학생용)을 통해',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    const Text(
                      '쉽고 간편하게 진로진학 상담 스케줄링이 가능합니다!',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 52,
                      width: 170,
                      decoration: BoxDecoration(
                        color: AppColor.font1,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          SvgPicture.asset(
                            'assets/images/logo2.svg',
                            width: 120,
                            height: 14,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Center(
                            child: Text(
                              '바로가기',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
