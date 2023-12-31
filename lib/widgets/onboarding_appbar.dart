import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;

  const OnboardingAppbar({
    super.key,
    this.hasBackButton = false,
  });

  void _pressCancel(BuildContext context) {
    FocusScope.of(context).unfocus();
    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: hasBackButton
          ? TextButton(
              onPressed: () => _pressCancel(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          : null,
      leadingWidth: hasBackButton ? 90 : null,
      title: const FaIcon(
        FontAwesomeIcons.twitter,
        color: Colors.blue,
        size: 35.0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
