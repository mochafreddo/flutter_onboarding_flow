import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow/password_screen.dart';
import 'package:flutter_onboarding_flow/widgets/onboarding_appbar.dart';
import 'package:flutter_onboarding_flow/widgets/verification_code.dart';
import 'package:gap/gap.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  bool _onEditing = true;
  String? _code;

  void _tapNext() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const OnboardingAppbar(hasBackButton: true),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We sent you a code',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                const Gap(20.0),
                Text(
                  'Enter it below to verify',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const Gap(2.0),
                Text(
                  'jhon.mobbin@gmail.com',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const Gap(20.0),
                VerificationCode(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  keyboardType: TextInputType.number,
                  length: 6,
                  digitsOnly: true,
                  onCompleted: (String value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                    if (!_onEditing) FocusScope.of(context).unfocus();
                  },
                ),
                const Gap(20.0),
                if (!_onEditing)
                  Center(
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green.shade600,
                      size: 35.0,
                    ),
                  ),
                const Expanded(
                  child: Gap(10.0),
                ),
                Text(
                  'Didn\'t receive email?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.blue.shade500),
                ),
                const Gap(15.0),
                GestureDetector(
                  onTap: _onEditing ? null : _tapNext,
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _onEditing ? Colors.grey.shade300 : Colors.black,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: _onEditing
                                        ? Colors.grey.shade500
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                          child: const Text('Next'),
                        ),
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
