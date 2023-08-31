import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow_part_one/sign_up_screen.dart';

void main() {
  // Ensure that widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const OnboardingFlowPartOne());
}

class OnboardingFlowPartOne extends StatelessWidget {
  const OnboardingFlowPartOne({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Onboarding Flow Part One",
      home: const SignUpScreen(),
      theme: ThemeData(
        colorScheme: const ColorScheme(
          background: Colors.white,
          primary: Colors.blue,
          secondary: Colors.blue,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
