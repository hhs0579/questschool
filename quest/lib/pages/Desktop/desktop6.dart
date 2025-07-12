import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Desktop6 extends StatelessWidget {
  const Desktop6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF7700),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.only(top: 60, bottom: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '실제 사용 후기',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '선생님들과 학생들 모두 추천하는',
                      style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '만족도 4.8의 퀘스트스쿨!',
                      style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '만족도',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('assets/images/i9.png'),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '5.0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 48),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 1,
                          height: 32,
                          color: Color(0xffD9D9D9),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              '추천 지수',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('assets/images/i10.png'),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '100%',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 48),
                                )
                              ],
                            )
                          ],
                        )
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
