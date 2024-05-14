import 'package:facebookui/screen/signin.dart';
import 'package:facebookui/widgets/WelcomeButton.dart';
import 'package:facebookui/widgets/customscreen.dart';
import 'package:facebookui/widgets/inputField.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formSignupKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScreenScaffold(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1)),
                child: Form(
                  key: _formSignupKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text(
                          'Registration',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInputData(
                          hintText: 'Enter Full Name',
                          inputType: TextInputType.name,
                          controller: _fullNameController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInputData(
                          hintText: 'Enter Email Address',
                          inputType: TextInputType.emailAddress,
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInputData(
                          hintText: 'Enter Address',
                          inputType: TextInputType.streetAddress,
                          controller: _addressController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInputData(
                          hintText: 'Enter Password',
                          inputType: TextInputType.visiblePassword,
                          controller: _passwordController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInputData(
                          hintText: 'Enter Phone Number',
                          inputType: TextInputType.number,
                          controller: _phoneNumberController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomWelcomeButton(
                            buttonname: 'Register',
                            onTap: () {
                              if (_formSignupKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Registeration Succefully'),
                                  ),
                                );
                              }
                            })
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
