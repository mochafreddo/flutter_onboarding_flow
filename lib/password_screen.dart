import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow/interests_screen.dart';
import 'package:flutter_onboarding_flow/widgets/onboarding_appbar.dart';
import 'package:gap/gap.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isPasswordVisible = false;
  bool _isPasswordEntered = false;

  void _tapNext() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const OnboardingAppbar(),
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
                  "You'll need a password",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                const Gap(15.0),
                Text(
                  "Make sure it's 8 characters or more.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const Gap(40.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _isPasswordEntered = value.isNotEmpty;
                    });
                  },
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400,
                        ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey.shade500,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        const Gap(10.0),
                        if (_isPasswordEntered)
                          Icon(
                            Icons.check_circle,
                            color: Colors.green.shade400,
                          ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: Gap(10.0),
                ),
                GestureDetector(
                  onTap: _isPasswordEntered ? _tapNext : null,
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _isPasswordEntered
                            ? Colors.black
                            : Colors.grey.shade300,
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
                                    color: _isPasswordEntered
                                        ? Colors.white
                                        : Colors.grey.shade500,
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
