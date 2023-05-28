import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titok_clone/constants/gaps.dart';
import 'package:titok_clone/constants/sizes.dart';
import 'package:titok_clone/features/onboarding/widgets/interest_screen.dart';

import 'form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  final String _birthday = "";
  DateTime initialDate = DateTime(
      DateTime.now().year - 12, DateTime.now().month, DateTime.now().day);

  @override
  void initState() {
    super.initState(); // 초기화는 먼저 것이 합리적임
    // print(initialDate);
    _setTextFiledToDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose(); // dispose 를 뒤에 하는 것이 합리적임
  }

  void _onNextTap() {
    if (_birthdayController.text.isEmpty) return;

    print(_birthdayController.text);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestScreen(),
      ),
    );
  }

  void _setTextFiledToDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Sign up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "When's your birthday",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v8,
            const Text(
              "You can always change this later.",
              style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            Gaps.v8,
            TextField(
              controller: _birthdayController,
              decoration: InputDecoration(
                // hintText: "user name",
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                disabled: _birthday.isNotEmpty,
                title: "Next",
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
              onDateTimeChanged: _setTextFiledToDate,
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTime.now(),
              initialDateTime: initialDate),
        ),
      ),
    );
  }
}
