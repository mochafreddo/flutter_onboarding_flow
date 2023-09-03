import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow_part_one/create_account_screen.dart';
import 'package:flutter_onboarding_flow_part_one/widgets/create_account_button.dart';
import 'package:flutter_onboarding_flow_part_one/widgets/onboarding_appbar.dart';
import 'package:flutter_onboarding_flow_part_one/widgets/social_signup_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  _tapCreateAccountButton(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnboardingAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(MediaQuery.of(context).size.height * 0.11),
              Text(
                "See what's happening in the world right now.",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                  fontSize: 34.0,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(MediaQuery.of(context).size.height * 0.11),
              const SocialSignupButton(
                icon: FaIcon(FontAwesomeIcons.google),
                text: 'Continue with Google',
              ),
              const Gap(15.0),
              const SocialSignupButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: 'Continue with Apple',
              ),
              const Gap(20.0),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.7,
                      endIndent: 15.0,
                    ),
                  ),
                  const Text('or'),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.7,
                      indent: 15.0,
                    ),
                  ),
                ],
              ),
              const Gap(10.0),
              GestureDetector(
                onTap: () => _tapCreateAccountButton(context),
                child: const CreateAccountButton(),
              ),
              const Gap(25.0),
              RichText(
                text: TextSpan(
                  text: 'By signing up, you agree to our ',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(text: ', '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(text: ', and '),
                    TextSpan(
                      text: 'Cookie Use',
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              const Gap(70),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Have an account already? ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: Colors.blue.shade600,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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
