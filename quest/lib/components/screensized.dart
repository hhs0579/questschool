import 'package:flutter/material.dart';

// 화면 크기별 상수 정의
class ScreenSize {
  static const double mobile = 650;
  static const double tablet = 1100;
  static const double desktop = 1100;
}

// 반응형 유틸리티 클래스
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < ScreenSize.mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < ScreenSize.tablet &&
      MediaQuery.of(context).size.width >= ScreenSize.mobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= ScreenSize.desktop;
      
  // 현재 화면 너비 가져오기
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
      
  // 현재 화면 높이 가져오기
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
      
  // 화면 너비의 비율 계산
  static double widthPercent(BuildContext context, double percent) =>
      width(context) * percent;
      
  // 화면 높이의 비율 계산
  static double heightPercent(BuildContext context, double percent) =>
      height(context) * percent;
}

// 반응형 위젯 래퍼
class ResponsiveLayout extends StatefulWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ScreenSize.desktop) {
          return KeyedSubtree(
            key: const ValueKey('desktop_view'),
            child: widget.desktop,
          );
        }
        if (constraints.maxWidth >= ScreenSize.mobile) {
          return KeyedSubtree(
            key: const ValueKey('tablet_view'),
            child: widget.tablet ?? widget.mobile,
          );
        }
        return KeyedSubtree(
          key: const ValueKey('mobile_view'),
          child: widget.mobile,
        );
      },
    );
  }
}