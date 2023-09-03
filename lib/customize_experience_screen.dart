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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        // fontSize: 18.0,
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
                text: const TextSpan(
                  text:
                      'By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Others will be able to find you by email or phone number when provided · Privacy Options',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
