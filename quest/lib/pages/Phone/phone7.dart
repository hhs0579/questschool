import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest/widget/imageslider.dart';

class Phone7 extends StatelessWidget {
  const Phone7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '현직 진로 선생님들의 이야기에',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text('귀 기울여 제작하였습니다',
                      style: TextStyle(
                        color: AppColor.font1,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 16),
                  Text(
                    '앞으로도 선생님과 학생들의 이야기를 통해',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  Text(
                    '업데이트를 진행하겠습니다.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 192,
                    height: 44,
                    decoration: BoxDecoration(
                        color: AppColor.font1,
                        borderRadius: BorderRadius.circular(99)),
                    child: const Center(
                      child: Text(
                        '퀘스트스쿨 소식 듣기',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                     const SizedBox(
                    height: 16,
                  ),
                  Expanded(child: const ImageSlider2()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
