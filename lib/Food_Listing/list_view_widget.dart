import 'package:flutter/material.dart';
import 'package:facebookui/model/food.dart';
import 'package:facebookui/Food_Listing/fooddetails.dart';

class ListViewWidget extends StatelessWidget {
  final List<Food> foods = [
    Food(
      name: 'Pizza',
      price: 239,
      imageUrl: 'assets/shourav-sheikh-a66sGfOnnqQ-unsplash.jpg',
      description:
          'Spiciest veg pizza with jalapeno & red paprika toppings and a new spicy peri peri sauce.',
    ),
    Food(
      name: 'French Frise',
      price: 280,
      imageUrl: 'assets/ben-lei-flFd8L7_B3g-unsplash.jpg',
      description:
          'Cheesy goodness in a blend of mixed vegetables layered with crisp lettuce, fresh onions, and draped in a rich cheesy sauce. Now available in a mini version!',
    ),
    Food(
      name: 'Burger',
      price: 239,
      imageUrl: 'assets/amirali-mirhashemian-sc5sTPMrVfk-unsplash.jpg',
      description:
          'Spiciest veg pizza with jalapeno & red paprika toppings and a new spicy peri peri sauce.',
    ),
    Food(
      name: 'Fruit Dishes',
      price: 259,
      imageUrl: 'assets/brooke-lark-lcZ9NxhOSlo-unsplash.jpg',
      description:
          'Cheesy goodness in a blend of mixed vegetables layered with crisp lettuce, fresh onions, and draped in a rich cheesy sauce. Now available in a mini version!',
    ),
    Food(
      name: 'Non Veg Dish',
      price: 350,
      imageUrl: 'assets/prasanta-kr-dutta-yu8eJpRvlS8-unsplash.jpg',
      description:
          'Cheesy goodness in a blend of mixed vegetables layered with crisp lettuce, fresh onions, and draped in a rich cheesy sauce. Now available in a mini version!',
    ),
    Food(
      name: 'Veggies',
      price: 259,
      imageUrl: 'assets/jennifer-schmidt-zOlQ7lF-3vs-unsplash.jpg',
      description:
          'Cheesy goodness in a blend of mixed vegetables layered with crisp lettuce, fresh onions, and draped in a rich cheesy sauce. Now available in a mini version!',
    ),
    Food(
      name: 'Momos',
      price: 200,
      imageUrl: 'assets/shiv-singh-Vj-J5xNjnxA-unsplash.jpg',
      description:
          'Cheesy goodness in a blend of mixed vegetables layered with crisp lettuce, fresh onions, and draped in a rich cheesy sauce. Now available in a mini version!',
    ),
    Food(
      name: 'Chaines plate',
      price: 300,
      imageUrl: 'assets/fernando-santos-DppzIK9TAxY-unsplash.jpg',
      description:
          'Cheesy goodness in a blend of mixed vegetables layered with crisp lettuce, fresh onions, and draped in a rich cheesy sauce. Now available in a mini version!',
    ),
    Food(
      name: 'Fried Spring Rolls',
      price: 250,
      imageUrl: 'assets/pexels-thngocbich-840216.jpg',
      description:
          'Cheesy goodness in a blend of mixed vegetables layered with crisp lettuce, fresh onions, and draped in a rich cheesy sauce. Now available in a mini version!',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          (foods.length / 2).ceil(), // Calculate the number of rows needed
      itemBuilder: (context, index) {
        final int firstIndex = index * 2;
        final int secondIndex = index * 2 + 1;
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FoodDetailPage(food: foods[firstIndex]),
                    ),
                  );
                },
                child: _buildTile(foods[firstIndex]),
              ),
            ),
            Expanded(
              child: secondIndex < foods.length
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FoodDetailPage(food: foods[secondIndex]),
                          ),
                        );
                      },
                      child: _buildTile(foods[secondIndex]),
                    )
                  : Container(), // Return an empty container if the second index exceeds the list length
            ),
          ],
        );
      },
    );
  }

  Widget _buildTile(Food food) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ListTile(
          contentPadding: const EdgeInsets.all(15.0),
          leading: ClipRRect(
            borderRadius:
                BorderRadius.circular(10.0), // Keep the rounded corners
            child: Image.asset(
              food.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              food.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text('\Rs.${food.price.toStringAsFixed(2)}'),
          ),
          trailing: const MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.purpleAccent,
            ),
          ),
        ),
      ),
    );
  }
}
