import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';
import 'package:quest/components/painter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Desktop6 extends StatefulWidget {
  const Desktop6({super.key});

  @override
  State<Desktop6> createState() => _Desktop6State();
}

class _Desktop6State extends State<Desktop6> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final List<Map<String, String>> reviews = [
    {
      'title': '체계적인 상담 시스템이 형성되어 있고 다양한 기능을 편하게 이용할 수 있어 좋았습니다.',
      'content':
          '퀘스트스쿨을 통해 진로에 대한 명확한 방향을 잡을 수 있었어요. AI 상담과 심리검사가 정말 도움이 되었습니다.',
    },
    {
      'title': '전문적인 상담 서비스를 통해서 진로에 대한 명확한 방향을 잡을 수 있었어요.',
      'content': '체계적인 커리큘럼과 전문적인 상담 덕분에 진로 고민이 해결되었어요. 선생님들이 정말 친절하세요!',
    },
    {
      'title': '다양한 심리검사를 할수 있어서 좋았습니다.',
      'content': '다양한 진로심리검사를 통해 제 성향을 정확히 파악할 수 있었고, 맞춤형 상담이 인상적이었습니다.',
    },
    {
      'title': 'AI 대화형 상담을 할수 있어서 좋았습니다.',
      'content': 'AI 대화형 상담이 재미있었고, 상담 주제를 쉽게 정할 수 있어서 좋았어요. 정말 만족스러운 경험이었습니다.',
    },
    {
      'title': '맞춤형 진로 상담을 할수 있어서 좋았습니다.',
      'content': '진로에 대한 고민이 많았는데, 상담을 통해 명확한 방향을 잡을 수 있었어요. 추천합니다!',
    },
    {
      'title': '효과적인 상담 경험을 할수 있어서 좋았습니다.',
      'content': '각 학생의 상황에 맞는 맞춤형 상담을 제공해주셔서 매우 효과적이었습니다. 감사합니다!',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    } catch (e) {
      print('URL 실행 중 오류 발생: $e');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: const Color(0xffFF7700),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: isMobile ? 40 : (screenWidth < 1200 ? 80 : 120),
                    bottom: isMobile ? 40 : (screenWidth < 1200 ? 80 : 120),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '실제 사용 후기',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: isMobile ? 8 : 12),
                      Text(
                        '선생님들과 학생들 모두 추천하는',
                        style: TextStyle(
                          fontSize:
                              isMobile ? 24 : (screenWidth < 1200 ? 36 : 48),
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      ),
                      Text(
                        '만족도 4.8의 퀘스트스쿨!',
                        style: TextStyle(
                          fontSize:
                              isMobile ? 24 : (screenWidth < 1200 ? 36 : 48),
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      isMobile
                          ? Column(
                              children: [
                                _buildMobileStatItem(
                                    '만족도', '5.0', 'assets/images/i9.png'),
                                SizedBox(height: 20),
                                _buildMobileStatItem(
                                    '추천 지수', '100%', 'assets/images/i10.png'),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      '만족도',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          child: Image.asset(
                                            'assets/images/i9.png',
                                            cacheWidth: 80,
                                            cacheHeight: 80,
                                            filterQuality: FilterQuality.medium,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '5.0',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize:
                                                screenWidth < 1200 ? 36 : 48,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(width: 50),
                                Container(
                                  width: 1,
                                  height: 32,
                                  color: Color(0xffD96500),
                                ),
                                const SizedBox(width: 50),
                                Column(
                                  children: [
                                    const Text(
                                      '추천 지수',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          child: Image.asset(
                                            'assets/images/i10.png',
                                            cacheWidth: 80,
                                            cacheHeight: 80,
                                            filterQuality: FilterQuality.medium,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '100%',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize:
                                                screenWidth < 1200 ? 36 : 48,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                      SizedBox(
                          height:
                              isMobile ? 20 : (screenWidth < 1200 ? 30 : 40)),
                      Container(
                        height:
                            isMobile ? 160 : (screenWidth < 1200 ? 200 : 240),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              ...reviews
                                  .map((review) => _buildReviewCard(
                                      review, isMobile ? 160 : 220))
                                  .toList(),
                              ...reviews
                                  .take(3)
                                  .map((review) => _buildReviewCard(
                                      review, isMobile ? 160 : 220))
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height:
                            isMobile ? 160 : (screenWidth < 1200 ? 200 : 240),
                        child: SingleChildScrollView(
                          controller: _scrollController2,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              ...reviews
                                  .take(3)
                                  .map((review) => _buildReviewCard(
                                      review, isMobile ? 160 : 220))
                                  .toList(),
                              ...reviews
                                  .map((review) => _buildReviewCard(
                                      review, isMobile ? 160 : 200))
                                  .toList(),
                            ],
                          ),
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
    );
  }

  // 리뷰 카드 위젯을 별도 메서드로 분리하여 재사용성과 성능 향상
  Widget _buildReviewCard(Map<String, String> review, double height) {
    return Container(
      width: 300,
      height: height,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review['title']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                review['content']!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.4,
                ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileStatItem(String label, String value, String imagePath) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              child: Image.asset(
                imagePath,
                cacheWidth: 64,
                cacheHeight: 64,
                filterQuality: FilterQuality.medium,
              ),
            ),
            SizedBox(width: 8),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 28,
              ),
            )
          ],
        ),
      ],
    );
  }
}
