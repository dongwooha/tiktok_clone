import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:titok_clone/constants/gaps.dart';
import 'package:titok_clone/features/authentication/widgets/login_form_screen.dart';

import '../../../constants/sizes.dart';
import 'auth_bottons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignupTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "Log in for Tiktok",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                "Manage your a profile, blahblahblahblahblahblahblahblahblahblahblahblahblahblah",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: (() => _onEmailLoginTap(context)),
                child: const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.user),
                  text: "use email and password",
                ),
              ),
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "continue with Apple",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have account?"),
              Gaps.h6,
              GestureDetector(
                onTap: () => onSignupTap(context),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
