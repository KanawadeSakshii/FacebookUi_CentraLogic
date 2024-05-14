import 'package:facebookui/widgets/WelcomeButton.dart';
import 'package:flutter/material.dart';
import 'package:facebookui/model/food.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;

  const FoodDetailPage({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 225, 247),
        title: Text(food.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.deepPurpleAccent,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    food.imageUrl,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    food.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\Rs.${food.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 46, 46, 46)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    food.description,
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 12, 12, 12)),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomWelcomeButton(
                  onTap: () {
                    Navigator.pop(context); // Navigate back to previous screen
                  },
                  buttonname: 'Back',
                ),
                CustomWelcomeButton(
                  onTap: () {},
                  buttonname: 'Order Now',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
