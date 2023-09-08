import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow_part_one/initial_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
        fontFamily: GoogleFonts.roboto().fontFamily,
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
