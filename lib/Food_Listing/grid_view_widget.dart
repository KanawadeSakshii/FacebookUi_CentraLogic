import 'package:flutter/material.dart';
import 'package:facebookui/model/food.dart';
import 'package:facebookui/Food_Listing/fooddetails.dart';

class GridViewWidget extends StatelessWidget {
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, //4 food in one row
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final product = foods[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailPage(food: product),
              ),
            );
          },
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('\Rs.${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
