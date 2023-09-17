import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow/widgets/interest_button_part_two.dart';
import 'package:flutter_onboarding_flow/widgets/onboarding_appbar.dart';
import 'package:gap/gap.dart';

// 사용자의 관심사를 선택하는 두 번째 화면을 나타내는 위젯
class InterestsPartTwoScreen extends StatefulWidget {
  const InterestsPartTwoScreen({super.key});

  @override
  State<InterestsPartTwoScreen> createState() => _InterestsPartTwoScreenState();
}

class _InterestsPartTwoScreenState extends State<InterestsPartTwoScreen> {
  // 사용자의 관심사를 선택하는 두 번째 화면을 나타내는 위젯
  final List<String> _interestsMusic = [
    'Rap',
    'R&B & soul',
    'Grammy Awards',
    'Pop',
    'K-pop',
    'Music industry',
    'EDM',
    'Music news',
    'Hip hop',
    'Raggae',
    'Rock',
    'Classical music',
    'Country music',
    'Jazz',
    'Metal',
    'Blues',
    'Folk & acoustic',
    'Indie',
    'Latin music',
    'Punk',
    'World music',
    'Dance & electronic',
  ];

  // 사용자의 관심사를 선택하는 두 번째 화면을 나타내는 위젯
  final List<String> _interestsEntertainment = [
    'Anime',
    'Movie & TV',
    'Harry Potter',
    'Marvel Universe',
    'Movie news',
    'Naruto',
    'Movies',
    'Grammy Awards',
    'Entertainment',
    'Game of Thrones',
    'Star Wars',
    'The Walking Dead',
    'The Simpsons',
    'The Avengers',
    'The Lord of the Rings',
    'The Hunger Games',
    'The Big Bang Theory',
    'The Flash',
  ];

  // 사용자가 선택한 관심사의 수
  int _selectedCount = 0;

  // 선택한 관심사의 수를 1 증가시키는 함수
  void incrementSelectedCount() {
    setState(() {
      _selectedCount++;
    });
  }

  // 선택한 관심사의 수를 1 감소시키는 함수
  void decrementSelectedCount() {
    setState(() {
      _selectedCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // 배경을 탭하면 키보드를 숨김
      child: Scaffold(
        appBar: const OnboardingAppbar(), // 상단 앱바
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 30.0,
              ),
              child: Column(
                children: [
                  // 화면 상단의 제목 텍스트
                  Text(
                    'What do you want to see on Twitter?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  const Gap(10.0),
                  // 화면 상단의 설명 텍스트
                  Text(
                    'Interests are used to persionalize your experience and will be visible on your profile.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(height: 1.3),
                  )
                ],
              ),
            ),
            // 구분선
            Container(
              height: 1.0,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade300),
            ),
            // 음악 관련 관심사 목록
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 음악 관련 관심사 목록의 내용
                  children: [
                    Text(
                      'Music',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                    const Gap(10.0),
                    Expanded(
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 1000.0,
                            child: Wrap(
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: [
                                for (var interest in _interestsMusic)
                                  InterestButtonPartTwo(
                                    interest: interest,
                                    onSelected: incrementSelectedCount,
                                    onDeselected: decrementSelectedCount,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // 구분선
            Container(
              height: 1.0,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade300),
            ),
            // 엔터테인먼트 관련 관심사 목록
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 엔터테인먼트 관련 관심사 목록의 내용
                  children: [
                    Text(
                      'Entertainment',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                    const Gap(10.0),
                    Expanded(
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 1000.0,
                            child: Wrap(
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              alignment: WrapAlignment.start,
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: [
                                for (var interest in _interestsEntertainment)
                                  InterestButtonPartTwo(
                                    interest: interest,
                                    onSelected: incrementSelectedCount,
                                    onDeselected: decrementSelectedCount,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        // 하단의 "Next" 버튼
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
