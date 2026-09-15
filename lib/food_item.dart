import 'package:flutter/material.dart';
import 'food_details_screen.dart';

class FoodItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double price;
  final List<String> ingredients;
  final Map<String, double> sizes;
  final Map<String, double> addOns;

  const FoodItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    this.ingredients = const [],
    this.sizes = const {},
    this.addOns = const {},
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsScreen(
              image: image,
              title: title,
              description: description,
              price: price,
              ingredients: ingredients,
              sizes: sizes,
              addOns: addOns,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$price EGP",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}