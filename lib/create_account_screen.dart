import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow/confirmation_code_screen.dart';
import 'package:flutter_onboarding_flow/customize_experience_screen.dart';
import 'package:flutter_onboarding_flow/widgets/onboarding_appbar.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdayController = TextEditingController();
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isBirthdayValid = false;
  DateTime initialDate = DateTime.now();
  bool showSignUpButton = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateName);
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _validateName() {
    setState(() {
      _isNameValid = _nameController.text.isNotEmpty;
    });
  }

  void _validateEmail() {
    final String input = _emailController.text;

    // 이메일 유효성 검사
    final bool isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);

    // 국제 전화번호 유효성 검사
    final bool isInternationalPhoneValid =
        RegExp(r"^\+[1-9]{1}[0-9\-]{3,14}$").hasMatch(input);

    // 한국 전화번호 유효성 검사 (하이픈 허용)
    final bool isKoreanPhoneValid =
        RegExp(r"^010-?\d{4}-?\d{4}$").hasMatch(input);

    setState(() {
      _isEmailValid =
          isEmailValid || isInternationalPhoneValid || isKoreanPhoneValid;
    });
  }

  void _nextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CustomizeExperienceScreen(),
      ),
    );
    setState(() {
      showSignUpButton = true;
      FocusScope.of(context).unfocus();
    });
  }

  void _selectBirthday() async {
    if (_birthdayController.text.isEmpty) {
      setState(() {
        _setTextFieldDate(initialDate);
        _isBirthdayValid = true;
      });
    }

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        FocusScope.of(context).unfocus();
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: initialDate,
            maximumDate: initialDate,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                String formattedDate =
                    DateFormat('MMMM d, y').format(newDateTime);
                _birthdayController.text = formattedDate;
                _isBirthdayValid = true;
              });
            },
          ),
        );
      },
    );
  }

  bool get _isFormValid => _isNameValid && _isEmailValid && _isBirthdayValid;

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _setTextFieldDate(DateTime date) {
    _birthdayController.value =
        TextEditingValue(text: DateFormat('MMMM d, y').format(date));
  }

  void _navigateToConfirmationCodeScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ConfirmationCodeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const OnboardingAppbar(hasBackButton: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30.0,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create your account',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displaySmall,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Gap(30.0),
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name',
                            suffixIcon: _isNameValid
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : null,
                          ),
                        ),
                        const Gap(15.0),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Phone number or email address',
                            hintText:
                                'Enter your phone number or email address',
                            suffixIcon: _isEmailValid
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : null,
                          ),
                        ),
                        const Gap(15.0),
                        GestureDetector(
                          onTap: _selectBirthday,
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: _birthdayController,
                              decoration: InputDecoration(
                                labelText: 'Date of birth',
                                hintText: 'Enter your date of birth',
                                suffixIcon: _isBirthdayValid
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        const Gap(15.0),
                        Visibility(
                          visible: _isBirthdayValid && !showSignUpButton,
                          child: Text(
                            'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Gap(0.0),
              ),
              if (!showSignUpButton)
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: _isFormValid ? _nextTap : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color:
                            _isFormValid ? Colors.black : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 27.0,
                          vertical: 12.0,
                        ),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: _isFormValid
                                        ? Colors.white
                                        : Colors.grey.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                          child: const Text('Next'),
                        ),
                      ),
                    ),
                  ),
                ),
              if (showSignUpButton)
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'By signing up, you agree to the ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: Colors.blue.shade300),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.blue.shade300),
                          ),
                          const TextSpan(text: ', including '),
                          TextSpan(
                            text: 'Cookie Use',
                            style: TextStyle(color: Colors.blue.shade300),
                          ),
                          const TextSpan(
                              text:
                                  '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. '),
                          TextSpan(
                            text: 'Learn more',
                            style: TextStyle(color: Colors.blue.shade300),
                          ),
                          const TextSpan(
                              text:
                                  '. Others will be able to find you by email or phone number, when provided, unless you choose otherwise '),
                          TextSpan(
                            text: 'here',
                            style: TextStyle(color: Colors.blue.shade300),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),
                    const Gap(20.0),
                    GestureDetector(
                      onTap: _navigateToConfirmationCodeScreen,
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Text(
                              'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
