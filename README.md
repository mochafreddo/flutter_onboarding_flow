# Flutter Onboarding Flow Part 1

This project is a Flutter implementation of the onboarding flow for a mobile application, inspired by the Twitter app's onboarding process. It's a part of a 21-day coding challenge, and this repository represents the work done on Day 17.

## Features

### 1. Initial Screen
- The first screen users see upon launching the app.
- Contains three buttons, including "Create Account" which navigates to the "Create Account" screen.

### 2. Create Account Screen
- A form with fields for "Name", "Email", and "Date Of Birth".
- Green icons appear next to each input field as the user fills them out.
- Once all fields are filled, the "Next" button becomes active.
- Navigates to the "Customize Experience" screen upon pressing "Next".

### 3. Customize Experience Screen
- Contains a switch input and a "Next" button.
- The "Next" button becomes active when the switch is enabled.

### 4. Create Account Screen Part Two
- Retains the data entered by the user in the previous step.
- Features a "Sign up" button instead of the "Next" button.

## Implementation Details

- The app's entry point is defined in [`main.dart`](https://github.com/mochafreddo/flutter_onboarding_flow_part_one/blob/main/lib/main.dart).
- The screens are implemented in separate Dart files:
  - [Initial Screen](https://github.com/mochafreddo/flutter_onboarding_flow_part_one/blob/main/lib/initial_screen.dart)
  - [Create Account Screen](https://github.com/mochafreddo/flutter_onboarding_flow_part_one/blob/main/lib/create_account_screen.dart)
  - [Customize Experience Screen](https://github.com/mochafreddo/flutter_onboarding_flow_part_one/blob/main/lib/customize_experience_screen.dart)
- Widgets such as the onboarding app bar, create account button, and social signup button are modularized for reusability:
  - [Onboarding App Bar](https://github.com/mochafreddo/flutter_onboarding_flow_part_one/blob/main/lib/widgets/onboarding_appbar.dart)
  - [Create Account Button](https://github.com/mochafreddo/flutter_onboarding_flow_part_one/blob/main/lib/widgets/create_account_button.dart)
  - [Social Signup Button](https://github.com/mochafreddo/flutter_onboarding_flow_part_one/blob/main/lib/widgets/social_signup_button.dart)

## Getting Started

To run this project:
1. Clone the repository: `git clone https://github.com/mochafreddo/flutter_onboarding_flow_part_one.git`
2. Navigate to the project directory: `cd flutter_onboarding_flow_part_one`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`