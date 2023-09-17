import 'package:flutter/material.dart';

// 사용자의 관심사를 나타내는 버튼 위젯
class InterestButtonPartTwo extends StatefulWidget {
  // 생성자에서 필요한 데이터와 콜백 함수를 받습니다.
  const InterestButtonPartTwo({
    super.key,
    required this.interest, // 관심사 이름
    required this.onSelected, // 선택됐을 때 호출될 함수
    required this.onDeselected, // 선택이 해제됐을 때 호출될 함수
  });

  final String interest;
  final VoidCallback onSelected;
  final VoidCallback onDeselected;

  @override
  State<InterestButtonPartTwo> createState() => _InterestButtonPartTwoState();
}

class _InterestButtonPartTwoState extends State<InterestButtonPartTwo> {
  // 현재 관심사가 선택됐는지 나타내는 상태 변수
  bool _isSelected = false;

  // 버튼이 탭됐을 때 호출되는 함수
  void _onTap() {
    setState(() {
      _isSelected = !_isSelected; // 선택 상태를 토글
      if (_isSelected) {
        widget.onSelected(); // 선택됐을 때의 콜백 함수 호출
      } else {
        widget.onDeselected(); // 선택 해제됐을 때의 콜백 함수 호출
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap, // 탭 이벤트 핸들러 설정
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
        duration: const Duration(milliseconds: 300), // 애니메이션 지속 시간 설정
        decoration: BoxDecoration(
          border: Border.all(
              color: _isSelected ? Colors.blue.shade400 : Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30.0),
          color: _isSelected
              ? Colors.blue.shade400
              : Colors.white, // 선택 상태에 따른 배경색 변경
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: _isSelected
                    ? Colors.white
                    : Colors.black, // 선택 상태에 따른 텍스트 색상 변경
                height: 1.2,
              ),
          child: Text(widget.interest), // 관심사 이름 표시
        ),
      ),
    );
  }
}
