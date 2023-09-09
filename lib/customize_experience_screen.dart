import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow_part_one/widgets/onboarding_appbar.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isSwitched = false;

  void _nextTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const OnboardingAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const Gap(20.0),
              Text(
                'Customize your experience',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 38.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Gap(30.0),
              Text(
                'Track where you see Twitter content across the web',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Gap(20.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Switch.adaptive(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
              const Gap(25.0),
              RichText(
                text: TextSpan(
                  text: 'By signing up, you agree to our ',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    color: Colors.grey.shade500,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.blue.shade300,
                      ),
                    ),
                    const TextSpan(text: ', '),
                    TextSpan(
                      text: 'Privacy',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.blue.shade300,
                      ),
                    ),
                    const TextSpan(text: ', '),
                    TextSpan(
                      text: 'Policy',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.blue.shade300,
                      ),
                    ),
                    const TextSpan(text: ', and '),
                    TextSpan(
                      text: 'Cookie Use',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.blue.shade300,
                      ),
                    ),
                    const TextSpan(
                        text:
                            '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. '),
                    TextSpan(
                      text: 'Learn more',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        color: Colors.blue.shade300,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: Gap(0.0)),
              GestureDetector(
                onTap: _isSwitched ? _nextTap : null,
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _isSwitched ? Colors.black : Colors.grey.shade300,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: _isSwitched
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
              const Gap(30.0),
            ],
          ),
        ),
      ),
    );
  }
}
