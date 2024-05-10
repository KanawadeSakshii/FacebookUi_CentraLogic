import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FbPage(),
    );
  }
}

class FbPage extends StatefulWidget {
  const FbPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FbPageState createState() => _FbPageState();
}

class _FbPageState extends State<FbPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/facebook.png',
                height: 110,
              ),
              Card(
                color: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 395,
                  height: 280,
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        // icon: Icons.email_sharp,
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        'Password',
                        _passwordController,
                        screenWidth,
                        screenHeight,
                        isPassword: true,
                        //  icon: Icons.lock,
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
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 175, 174, 174), fontSize: 17),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFD6D5D5), width: 0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFD6D5D5), width: 0.4),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: 364,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          // Handle login logic here
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
