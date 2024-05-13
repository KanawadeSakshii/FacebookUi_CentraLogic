import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputData extends StatefulWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final int maxLines;
  final bool isPassword;
  final int? phoneNumber;
  // IconData? Icon;

  const CustomInputData({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.maxLines = 1,
    this.isPassword = false,
    this.phoneNumber,
  });

  @override
  State<CustomInputData> createState() => _CustomInputDataState();
}

class _CustomInputDataState extends State<CustomInputData> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword,
      keyboardType: widget.inputType,
      maxLines: widget.maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 216, 214, 214)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 255, 255), width: 0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 8, 0, 0), width: 0.4),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hintText}';
        }
        if (widget.inputType == TextInputType.emailAddress) {
          if (!isValidEmail(value)) {
            return 'Please enter a valid email address';
          }
        }
        if (widget.inputType == TextInputType.visiblePassword) {
          if (!isValidPassword(value)) {
            return 'Password must be at least 6 characters long and contain letters, numbers, and special characters';
          }
        }
        if (widget.inputType == TextInputType.text &&
            widget.hintText == 'Full Name') {
          if (!isValidName(value)) {
            return 'Invalid Name';
          }
        }
        if (widget.inputType == TextInputType.number) {
          if (!isPhoneNumberValid(value)) {
            return 'Invalid Phone Number';
          }
        }
        return null;
      },
    );
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isPhoneNumberValid(String number) {
    final num = RegExp(r'^[0-9]{10}$');

    return num.hasMatch(number);
  }
}

bool isValidPassword(String password) {
  // Password must be at least 6 characters long and contain letters, numbers, and special characters
  final hasLetter = password.contains(RegExp(r'[a-zA-Z]'));
  final hasDigit = password.contains(RegExp(r'[0-9]'));
  final hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  return password.length >= 6 && hasLetter && hasDigit && hasSpecialChar;
}

bool isValidName(String name) {
  return name.isNotEmpty;
}
