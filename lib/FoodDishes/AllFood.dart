import 'package:facebookui/widgets/customscreen.dart';
import 'package:flutter/material.dart';

class AllfoodPage extends StatefulWidget {
  const AllfoodPage({super.key});

  @override
  State<AllfoodPage> createState() => _AllfoodPageState();
}

class _AllfoodPageState extends State<AllfoodPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScreenScaffold(
      child: Center(
        child: Text('All food Dishes'),
      ),
    );
  }
}
