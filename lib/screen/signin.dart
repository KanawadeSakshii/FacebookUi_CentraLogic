import 'package:facebookui/Food_Listing/home.dart';
import 'package:facebookui/screen/signup.dart';
import 'package:facebookui/widgets/WelcomeButton.dart';
import 'package:facebookui/widgets/customscreen.dart';
import 'package:facebookui/widgets/inputField.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool rememberPasswoed = true;
  @override
  Widget build(BuildContext context) {
    return CustomScreenScaffold(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              const Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2),
              ),
              const SizedBox(height: 20),
              Container(
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 252, 252, 252),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1.0),
                ),
                child: Form(
                  key: _formSignInKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Log in to Spicy World',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomInputData(
                          hintText: 'Enter Email Address',
                          controller: _emailController,
                          inputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        CustomInputData(
                          hintText: 'Enter Password',
                          controller: _passwordController,
                          inputType: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),
                        CustomWelcomeButton(
                            buttonname: 'Sign In',
                            onTap: () {
                              if (_formSignInKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Signing in...'),
                                  ),
                                );
                              }
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forget Password ?',
                                  style: TextStyle(color: Colors.blue),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()));
                                },
                                child: const Text(
                                  'Do not have Account?',
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        )
                      ],
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
}
