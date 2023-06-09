import 'package:flutter/material.dart';
import 'package:titok_clone/features/authentication/widgets/form_button.dart';
import 'package:titok_clone/features/onboarding/widgets/interest_screen.dart';

import '../../../constants/gaps.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({Key? key}) : super(key: key);

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void onSubmitTap() {
    // _formKey.currentState?.validate();
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        // print(formData.values);
        // print(formData);

        // push 를 사용할 경우 뒤로 돌아갈 수 있기 때문에
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const InterestScreen(),
        //   ),

        // );

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterestScreen(),
          ),
          // (route) {
          //   // print(route);
          //   return false;
          // },
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) {
                  // return "I don't like your email";
                  return null;
                },
                onSaved: ((newValue) {
                  if (newValue != null) {
                    formData['email'] = newValue;
                  }
                }),
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) {
                  // return "Wrong password";
                  return null;
                },
                onSaved: ((newValue) {
                  if (newValue != null) {
                    formData['password'] = newValue;
                  }
                }),
              ),
              Gaps.v20,
              GestureDetector(
                onTap: onSubmitTap,
                child: const FormButton(
                  disabled: false,
                  title: "Log in",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
