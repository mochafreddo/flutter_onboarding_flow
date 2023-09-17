import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow/initial_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const OnboardingFlowPartOne());
}

class OnboardingFlowPartOne extends StatelessWidget {
  const OnboardingFlowPartOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Onboarding Flow Part One",
      home: const InitialScreen(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          scrolledUnderElevation: 0.0,
        ),
      ),
    );
  }
}
