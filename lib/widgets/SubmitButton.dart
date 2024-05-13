import 'package:facebookui/widgets/WelcomeButton.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const SubmitButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWelcomeButton(
      buttonname: buttonName,
      onTap: onPressed,
    );
  }
}
