import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow/interests_part_two_screen.dart';
import 'package:flutter_onboarding_flow/widgets/interest_button.dart';
import 'package:flutter_onboarding_flow/widgets/onboarding_appbar.dart';
import 'package:gap/gap.dart';

// 사용자의 관심사를 선택하는 화면을 나타내는 위젯입니다.
class InterestsScreen extends StatefulWidget {
  // 사용자가 선택할 수 있는 관심사 목록입니다.
  static const List<String> interests = [
    'Fasion & beauty',
    'Outdoors',
    'Arts & culture',
    'Animation & comics',
    'Business & finance',
    'Food',
    'Travel',
    'Entertainment',
    'Music',
    'Gaming',
    'Sports',
    'Technology',
    'Science',
    'Health & fitness',
    'News & politics',
    'Parenting',
    'Home & garden',
    'Books & literature',
    'Pets',
    'Photography',
    'Design',
    'DIY',
    'Film',
    'TV',
    'Education',
  ];

  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => InterestsScreenState();
}

// InterestsScreen의 상태를 관리하는 클래스입니다.
class InterestsScreenState extends State<InterestsScreen> {
  // 사용자가 선택한 관심사의 수를 나타냅니다.
  int _selectedCount = 0;

  // 선택한 관심사의 수를 1 증가시킵니다.
  void incrementSelectedCount() {
    setState(() {
      _selectedCount++;
    });
  }

  // 선택한 관심사의 수를 1 감소시킵니다.
  void decrementSelectedCount() {
    setState(() {
      _selectedCount--;
    });
  }

  // "다음" 버튼을 누르면 다음 화면으로 이동하는 메서드입니다.
  void _tapNext(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const InterestsPartTwoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 화면을 탭하면 키보드 포커스를 해제합니다.
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const OnboardingAppbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // 화면 상단의 설명 텍스트를 표시하는 부분
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 30.0,
                right: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'What do you want to see on Twitter?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  const Gap(20.0),
                  Text(
                    'Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Gap(20.0),
                ],
              ),
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade300),
            ),
            // 관심사 목록을 표시하는 부분
            Flexible(
              flex: 1,
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(20.0),
                        Wrap(
                          runSpacing: 15.0,
                          spacing: 15.0,
                          children: [
                            // 각 관심사를 버튼 형태로 표시합니다.
                            for (var interest in InterestsScreen.interests)
                              InterestButton(
                                interest: interest,
                                onSelected: incrementSelectedCount,
                                onDeselected: decrementSelectedCount,
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        // 화면 하단의 "다음" 버튼을 포함하는 바를 표시하는 부분
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ), // 상단에 회색 선을 추가
            ),
          ),
          child: BottomAppBar(
            height: 90.0,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 30.0,
            ),
            elevation: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_selectedCount >= 3
                    ? 'Great work 🎉'
                    : '$_selectedCount of 3 selected'),
                GestureDetector(
                  onTap: () => _tapNext(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedCount >= 3
                          ? Colors.black
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: _selectedCount >= 3
                              ? Colors.white
                              : Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
