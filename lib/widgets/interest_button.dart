import 'package:flutter/material.dart';

// InterestButton 위젯은 사용자의 관심사를 나타내는 버튼입니다.
class InterestButton extends StatefulWidget {
  // InterestButton의 생성자. 관심사의 이름과 선택/해제 시 호출될 콜백을 받습니다.
  const InterestButton({
    super.key,
    required this.interest,
    required this.onSelected,
    required this.onDeselected,
  });

  final String interest; // 관심사의 이름
  final VoidCallback onSelected; // 버튼이 선택될 때 호출될 콜백
  final VoidCallback onDeselected; // 버튼이 해제될 때 호출될 콜백

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false; // 현재 버튼의 선택 상태를 나타내는 변수

  // 버튼이 탭될 때 호출되는 메서드. 선택 상태를 토글하고 적절한 콜백을 호출합니다.
  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
      if (_isSelected) {
        widget.onSelected();
      } else {
        widget.onDeselected();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap, // 버튼이 탭될 때 _onTap 메서드를 호출
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 80.0,
        width: MediaQuery.sizeOf(context).width / 2 - 38,
        decoration: BoxDecoration(
          border: Border.all(
              color: _isSelected ? Colors.blue.shade400 : Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10.0),
          color: _isSelected ? Colors.blue.shade400 : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 선택된 경우 체크 아이콘을 표시하는 부분
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: _isSelected ? Colors.white : Colors.black,
                          height: 1.2),
                      child: Text(widget.interest),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
