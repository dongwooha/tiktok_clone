import 'package:flutter/material.dart';
import 'package:titok_clone/features/authentication/widgets/form_button.dart';

import '../../../constants/gaps.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({Key? key}) : super(key: key);

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
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
          child: Column(
            children: const [
              TextField(),
              Gaps.v16,
              TextField(),
              Gaps.v20,
              FormButton(
                disabled: false,
                title: "Log in",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
