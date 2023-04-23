import 'package:flutter/material.dart';
import 'package:titok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.title,
  });

  final bool disabled;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(
          // seconds: 1,
          milliseconds: 500,
        ),
        decoration: BoxDecoration(
          // color: _username.contains("@")
          color:
              disabled ? Colors.grey.shade100 : Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(
              milliseconds: 500,
            ),
            style: TextStyle(
              color: disabled ? Colors.grey.shade400 : Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: Sizes.size16,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
