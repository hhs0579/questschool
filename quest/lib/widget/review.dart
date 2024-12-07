import 'package:flutter/material.dart';
import 'package:quest/components/color.dart';

class ReviewBox extends StatelessWidget {
  final String title;
  final String description;

  const ReviewBox({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 252,
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffEBEEF3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: AppColor.grey1,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewsSection extends StatelessWidget {
  ReviewsSection({Key? key}) : super(key: key);

  final List<Map<String, String>> reviews = [
    {
      'title': '상담이 체계적으로 형성되어 있고 다양한 기능을 편하게 이용할 수 있어 좋았습니다.',
      'description':
          '이용할 때 불편함이 있을거라고 생각했으나 앱이 꼼꼼하게 제작되어 매우 편하게 이용할 수 있는 서비스라고 생각이 들었습니다.',
    },
    {
      'title': '다양한 검사를 할 수 있어서 좋아요.',
      'description': '다양한 진로심리검사를 통해 저에 대해 알아볼 수 있는 시간을 가져서 좋았습니다',
    },
    {
      'title': '어떤 내용에 대해 상담할 지 몰랐는데 상담 주제를 정할 수 있어서 좋았어요.',
      'description':
          'AI 대화형 상담 주제 선정과 선택형 상담 주제 선정을 통해 상담하고 싶은 내용을 추천해줘서 상담하기 편했어요.',
    },
    {
      'title': '상담이 체계적으로 형성되어 있고 다양한 기능을 편하게 이용할 수 있어 좋았습니다.',
      'description':
          '이용할 때 불편함이 있을거라고 생각했으나 앱이 꼼꼼하게 제작되어 매우 편하게 이용할 수 있는 서비스라고 생각이 들었습니다.',
    },
    {
      'title': '선생님들의 전문성이 매우 뛰어나고 상담이 만족스러웠습니다.',
      'description': '진로에 대한 고민이 많았는데, 상담을 통해 명확한 방향을 잡을 수 있었습니다.',
    },
    {
      'title': '체계적인 커리큘럼과 맞춤형 상담이 인상적이었습니다.',
      'description': '각 학생의 상황에 맞는 맞춤형 상담을 제공해주셔서 매우 효과적이었습니다.',
    },
    {
      'title': '다양한 검사를 할 수 있어서 좋아요.',
      'description': '다양한 진로심리검사를 통해 저에 대해 알아볼 수 있는 시간을 가져서 좋았습니다',
    },
    {
      'title': '어떤 내용에 대해 상담할 지 몰랐는데 상담 주제를 정할 수 있어서 좋았어요.',
      'description':
          'AI 대화형 상담 주제 선정과 선택형 상담 주제 선정을 통해 상담하고 싶은 내용을 추천해줘서 상담하기 편했어요.',
    },
    {
      'title': '선생님들의 전문성이 매우 뛰어나고 상담이 만족스러웠습니다.',
      'description': '진로에 대한 고민이 많았는데, 상담을 통해 명확한 방향을 잡을 수 있었습니다.',
    },
    {
      'title': '체계적인 커리큘럼과 맞춤형 상담이 인상적이었습니다.',
      'description': '각 학생의 상황에 맞는 맞춤형 상담을 제공해주셔서 매우 효과적이었습니다.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: reviews
                      .map((review) => ReviewBox(
                            title: review['title']!,
                            description: review['description']!,
                          ))
                      .toList(),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
