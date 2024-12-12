import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quest/components/screensized.dart';

import 'package:quest/pages/Desktop/desktoppage.dart';

import 'package:quest/pages/Phone/phonepage.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// CustomScrollPhysics 클래스 추가
class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double get minFlingVelocity => 500.0; // 스크롤 감도 조절

  @override
  double get maxFlingVelocity => 8000.0; // 최대 스크롤 속도도 조절 가능
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController.fromVideoId(
      videoId: 'LUWbfI17_UU',
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: PhonePage(youtubeController: _youtubeController),
        desktop: DesktopPage(youtubeController: _youtubeController),
      ),
    );
  }
}
