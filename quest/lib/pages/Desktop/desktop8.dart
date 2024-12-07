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
  bool a = true;
  bool b = false;
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
              child: Container(
                padding: EdgeInsets.only(left: 135, top: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('실제 상담 후기',
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColor.font1,
                            fontWeight: FontWeight.w800)),
                    SizedBox(
                      height: 16,
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 36,
                            color: Colors.black),
                        children: [
                          TextSpan(text: '먼저 경험한 학교의\n'),
                          TextSpan(
                            text: '후기를 확인해 보세요.',
                          ),
                        ],
                      ),
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
                          TextSpan(text: '서비스를 이용한 학생들과 선생님이 직접 작성한 내용이며,\n'),
                          TextSpan(
                            text: '퀘스트스쿨에서 확인할 수 있습니다.',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 74,
                      width: 238,
                      child: SvgPicture.asset(
                        'assets/images/desk8.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              hoverColor: Colors.transparent, // 호버 효과 제거
                              onTap: () {
                                setState(() {
                                  a = !a;
                                  b = !b;
                                });
                              },
                              child: Container(
                                width: 123,
                                height: 44,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    color: a ? Color(0xff414042) : Colors.white,
                                    border:
                                        Border.all(color: Color(0xff93969B))),
                                child: Center(
                                    child: Text(
                                  '선생님 12',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color:
                                          a ? Colors.white : Color(0xff93969B)),
                                )),
                              ),
                            ),
                            SizedBox(height: 16),
                            InkWell(
                              hoverColor: Colors.transparent, // 호버 효과 제거
                              onTap: () {
                                setState(() {
                                  a = !a;
                                  b = !b;
                                });
                              },
                              child: Container(
                                width: 123,
                                height: 44,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    color: b ? Color(0xff414042) : Colors.white,
                                    border:
                                        Border.all(color: Color(0xff93969B))),
                                child: Center(
                                    child: Text(
                                  '학생 27',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color:
                                          b ? Colors.white : Color(0xff93969B)),
                                )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 77,
                        ),
                        ReviewsSection()
                      ],
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
