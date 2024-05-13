import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomScreenScaffold extends StatefulWidget {
  final Widget child;
  const CustomScreenScaffold({super.key, required this.child});

  @override
  State<CustomScreenScaffold> createState() => _CustomScreenScaffoldState();
}

class _CustomScreenScaffoldState extends State<CustomScreenScaffold> {
  // const CustomScreenScaffold({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/brooke-lark-lcZ9NxhOSlo-unsplash.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 9, sigmaY: 5),
            child: Container(
              color: Color.fromARGB(255, 143, 141, 141).withOpacity(0.5),
            ),
          )),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 40, 27, 27),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.1),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          // SizedBox(
          //   child: Container(
          //     padding: EdgeInsets.all(50),
          //     alignment: Alignment.topCenter,
          //     child: const Image(
          //       height: 100,
          //       width: 100,
          //       image: AssetImage('assets/food.png'),
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
