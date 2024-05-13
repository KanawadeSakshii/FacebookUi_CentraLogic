import 'package:flutter/material.dart';

class CustomWelcomeButton extends StatefulWidget {
  final String buttonname;
  final VoidCallback onTap;
  const CustomWelcomeButton(
      {super.key, required this.buttonname, required this.onTap});

  @override
  State<CustomWelcomeButton> createState() => _CustomWelcomeButtonState();
}

class _CustomWelcomeButtonState extends State<CustomWelcomeButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() {
        _isHovered = value;
      }),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                gradient: _isHovered
                    ? const LinearGradient(
                        colors: [
                            Color.fromARGB(255, 122, 2, 84),
                            Color.fromARGB(255, 192, 92, 5),
                          ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    : const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 22, 66, 34),
                          Color.fromARGB(31, 176, 54, 54),
                          Color.fromARGB(221, 121, 30, 30)
                        ],
                      ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Text(
              widget.buttonname,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
