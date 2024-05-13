import 'package:facebookui/screen/signin.dart';
import 'package:facebookui/screen/signup.dart';
import 'package:facebookui/widgets/customscreen.dart';
import 'package:flutter/material.dart';

import '../widgets/WelcomeButton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenScaffold(
      child: Column(
        children: <Widget>[
          Flexible(
              flex: 11,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Welcome To Asian Food Restro..!\n',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: '\n Login First To Order Your delicious Food.',
                        style: TextStyle(fontSize: 22, color: Colors.white)),
                    TextSpan(
                        text:
                            '\n \n \n Food is really and truly the most effective medicine.',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w200)),
                  ]),
                ),
              )),
          Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: CustomWelcomeButton(
                        buttonname: 'Sign In',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()),
                          );
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: CustomWelcomeButton(
                        buttonname: 'Sign Up',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ));
                        },
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
