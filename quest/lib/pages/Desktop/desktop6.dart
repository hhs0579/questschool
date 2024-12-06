import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Desktop6 extends StatelessWidget {
  const Desktop6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                Positioned.fill(
                  // 전체 화면을 채우는 SVG 배경
                  child: Image.asset(
                    'assets/images/back.png', // SVG 파일 경로
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 308),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                    color: Colors.black),
                                children: [
                                  TextSpan(text: '세계적으로 가장 권위있는\n'),
                                  TextSpan(
                                    text: '국제표준 정보보호 인증',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'ISO 27001:2013 취득',
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  color: AppColor.font1),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black),
                                children: [
                                  TextSpan(text: '높은 수준의 정보보호 시스템으로 민감한 정보의\n'),
                                  TextSpan(
                                    text: '빈틈없는 보안,안심할 수 있는 안전한 서비스 퀘스트스쿨',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 670,
                          height: 558,
                          child: Image.asset(
                            'assets/images/desk6.png',
                            fit: BoxFit.contain,
                          ))
                    ],
                  ),
                )
              ]));
        },
      ),
    );
  }
}
