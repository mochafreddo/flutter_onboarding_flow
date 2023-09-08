import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_flow_part_one/customize_experience_screen.dart';
import 'package:flutter_onboarding_flow_part_one/widgets/onboarding_appbar.dart';
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

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateName);
    _emailController.addListener(_validateEmail);
    _setTextFieldDate(DateTime.now());
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
  }

  void _selectBirthday() async {
    String formattedDate = DateFormat('MMMM d, y').format(initialDate);
    _birthdayController.text = formattedDate;
    _isBirthdayValid = true;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: initialDate,
            maximumDate: initialDate,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                formattedDate = DateFormat('MMMM d, y').format(newDateTime);
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

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _setTextFieldDate(DateTime date) {
    _birthdayController.value =
        TextEditingValue(text: DateFormat('MMMM d, y').format(date));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: const OnboardingAppbar(hasBackButton: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20.0),
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
                    hintText: 'Enter your phone number or email address',
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
                      enabled: false,
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
                  visible: _isBirthdayValid,
                  child: Text(
                    'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const Gap(30.0),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _isFormValid ? _nextTap : null,
                      child: const Text('Next'),
                    ),
                  ),
                ),
                const Gap(30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
