import 'package:flutter/material.dart';

class FbPage extends StatefulWidget {
  const FbPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FbPageState createState() => _FbPageState();
}

class _FbPageState extends State<FbPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/facebook.png',
              ),
              Card(
                color: const Color.fromARGB(255, 244, 244, 244),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Expanded(
                  child: Container(
                    width: 395,
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Log in to Facebook',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            'Email address or phone number',
                            _emailController,
                            screenWidth,
                            screenHeight,
                            icon: Icons.email_sharp,
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            'Password',
                            _passwordController,
                            screenWidth,
                            screenHeight,
                            isPassword: true,
                            icon: Icons.lock,
                          ),
                          const SizedBox(height: 10),
                          _buildLoginButton(),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _buildTextButton('Forgotten account?', () {}),
                              const SizedBox(width: 10),
                              _buildTextButton('Sign up for Facebook', () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hintText,
    TextEditingController controller,
    double screenWidth,
    double screenHeight, {
    bool isPassword = false,
    IconData? icon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 135, 135, 135), fontSize: 17),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 112, 111, 111), width: 0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 73, 72, 72), width: 0.4),
        ),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 250, 91, 79))),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: 364,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            String email = _emailController.text;
            String password = _passwordController.text;
            if (!_isEmailValid(email)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Email Not valid',
                    style: TextStyle(
                        backgroundColor: Colors.white, color: Colors.red),
                  ),
                  backgroundColor: Color.fromARGB(255, 158, 156, 156),
                ),
              );
            }
            if (!_isPasswordValid(password)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Password Not valid',
                    style: TextStyle(
                        backgroundColor: Colors.white, color: Colors.red),
                  ),
                  backgroundColor: Color.fromARGB(255, 158, 156, 156),
                ),
              );
            }
          }
          return;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1877F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Log in',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  bool _isEmailValid(String email) {
    _errorMessage = '';

    if (!email.contains(RegExp(r'[@]')) || !email.contains(RegExp(r'[.]'))) {
      _errorMessage = 'Email id invalid';
    }
    return _errorMessage.isEmpty;
  }

  bool _isPasswordValid(String password) {
    _errorMessage = '';

    if (password.length < 6) {
      _errorMessage += 'Password must be longer than 6 characers.\n';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      _errorMessage += 'Uppercase letter is missing.\n';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessage += 'Lowercase letter is missing.\n';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      _errorMessage += 'Digit letter is missing.\n';
    }
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      _errorMessage += 'Special character latter is missing.\n';
    }
    return _errorMessage.isEmpty;

    // final RegExp passwordRegex = RegExp(
    //   r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#%^&*(),.?":{}|<>]).{6,}$',
    // );
    // return passwordRegex.hasMatch(password);
  }

  Widget _buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF0589F5),
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
