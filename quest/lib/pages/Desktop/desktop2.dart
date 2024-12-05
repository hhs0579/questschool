import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Desktop2 extends StatelessWidget {
  const Desktop2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141414),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              'assets/images/desk2.svg',
            ),
            // child: Image.asset('assets/images/desk2.png'),
            // child: Padding(
            //   padding: const EdgeInsets.only(top: 120, left: 135),
            //   child: Row(
            //     children: [
            //       const Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text.rich(
            //             TextSpan(
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w800,
            //                 fontSize: 36,
            //                 color: Colors.white,
            //               ),
            //               children: [
            //                 TextSpan(text: '기존 진로진학\n'),
            //                 TextSpan(text: '상담 시스템의 '),
            //                 TextSpan(
            //                   text: '문제점',
            //                   style: TextStyle(color: AppColor.font1),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             height: 16,
            //           ),
            //           Text.rich(
            //             TextSpan(
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w500,
            //                 fontSize: 16,
            //                 color: Colors.white,
            //               ),
            //               children: [
            //                 TextSpan(text: '진로 설계와 진학 상담 과정이 비효율적이고\n'),
            //                 TextSpan(text: '학생 개개인에게 맞춘 지원이 부족해요\n'),
            //                 TextSpan(text: '선생님이 담당해야 하는 학생 수는 많은데,\n'),
            //                 TextSpan(text: '내용이 너무 많고 관리하기가 힘들어요.\n'),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         width: 420,
            //         height: 142, // 높이 증가
            //         child: Stack(
            //           clipBehavior: Clip.none,
            //           children: [
            //             Container(
            //               padding: const EdgeInsets.symmetric(
            //                 horizontal: 20,
            //                 vertical: 20, // 패딩 증가
            //               ),
            //               decoration: BoxDecoration(
            //                 color: const Color(0xff414042),
            //                 borderRadius: BorderRadius.circular(12),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.black.withOpacity(0.1),
            //                     blurRadius: 10,
            //                     offset: const Offset(0, 4),
            //                   ),
            //                 ],
            //               ),
            //               child: const Column(
            //                 crossAxisAlignment:
            //                     CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
            //                 children: [
            //                   Text(
            //                     '표준화된 상담 방식과 개인 맞춤형 설계 부족',
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: 20,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   SizedBox(height: 16),
            //                   Text.rich(
            //                     TextSpan(
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.w400,
            //                         fontSize: 16,
            //                         color: Colors.white,
            //                         height: 1.5, // 줄 간격 추가
            //                       ),
            //                       children: [
            //                         TextSpan(
            //                             text: '대부분 학생들의 고유한 특성과 목표를 반영하기보다\n'),
            //                         TextSpan(text: '일반적인 경로와 정보를 제공하는 방식에 의존'),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Positioned(
            //               bottom: 0,
            //               left: 20,
            //               child: Transform.rotate(
            //                 angle: 45 * 3.14 / 180, // 45도 회전
            //                 alignment: Alignment.center,
            //                 child: Container(
            //                   width: 20,
            //                   height: 10,
            //                   color: const Color(0xff414042),
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
