import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest/widget/imageslider.dart';

class Desktop7 extends StatelessWidget {
  const Desktop7({super.key});

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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 135, top: 237),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text.rich(
                          TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 36,
                                color: Colors.black),
                            children: [
                              TextSpan(text: '현직 진로 선생님들의 이야기에\n'),
                              TextSpan(
                                  text: '귀 기울여 제작하였습니다',
                                  style: TextStyle(color: AppColor.font1)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text.rich(
                          TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
                            children: [
                              TextSpan(text: '앞으로도 선생님과 학생들의 이야기를 통해\n'),
                              TextSpan(text: '업데이트를 진행하겠습니다.'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 130,
                  ),
                  const ImageSlider(),
                ],
              ));
        },
      ),
    );
  }
}
