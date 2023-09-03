import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow_part_one/initial_screen.dart';

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
      home: const InitialScreen(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
        ),
      ),
    );
  }
}
