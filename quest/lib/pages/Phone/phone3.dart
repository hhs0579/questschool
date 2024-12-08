  import 'package:flutter/material.dart';
  import 'package:quest/components/color.dart';
  import 'package:quest/components/painter.dart';
  import 'package:flutter_svg/flutter_svg.dart';

  class Phone3 extends StatelessWidget {
    const Phone3({super.key});

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
              child: SvgPicture.asset(
                'assets/images/phone3.svg',
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      );
    }
  }
