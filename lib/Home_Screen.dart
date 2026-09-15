import 'package:flutter/material.dart';
import 'category_item.dart';
import 'food_item.dart';
import 'drinks_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Menu"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.white,
          iconSize: 26,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.elliptical(10, 10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Text(
              "Hello Sara 👋",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "What do you want to eat today?",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Search your food...",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const CategoryItem(
                    image: "assets/images/Pizza.jpg",
                    title: "Pizza",
                  ),
                  const SizedBox(width: 10),
                  const CategoryItem(
                    image: "assets/images/Burger.png",
                    title: "Burger",
                  ),
                  const SizedBox(width: 10),
                  CategoryItem(
                    image: "assets/images/Drinks.jpg",
                    title: "Drinks",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DrinksScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  const CategoryItem(
                    image: "assets/images/gatoh.jpg",
                    title: "Dessert",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Foods",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const FoodItem(
              image: "assets/images/Burger.png",
              title: "Cheese Burger",
              description: "Delicious Burger",
              price: 95,
              ingredients: [
                "Beef",
                "Cheese",
                "Lettuce",
                "Tomato",
                "Onion",
              ],
              sizes: {
                "Small": 0,
                "Medium": 20,
                "Large": 40,
              },
              addOns: {
                "Extra Cheese": 15,
                "Extra Beef": 30,
              },
            ),
            const SizedBox(height: 15),
            const FoodItem(
              image: "assets/images/Drinks.jpg",
              title: "Cold Drink",
              description: "Fresh and Cold Drink",
              price: 69.99,
              ingredients: [
                "Cola",
                "Ice",
              ],
              sizes: {
                "Small": 0,
                "Medium": 10,
                "Large": 20,
              },
            ),
            const SizedBox(height: 15),
            const FoodItem(
              image: "assets/images/gatoh.jpg",
              title: "Chocolate Cake",
              description: "Sweet Chocolate Dessert",
              price: 44.99,
              ingredients: [
                "Chocolate",
                "Flour",
                "Eggs",
                "Milk",
                "Cream",
              ],
              addOns: {
                "Extra Chocolate": 10,
                "Extra Cream": 10,
              },
            ),
            const SizedBox(height: 15),
            const FoodItem(
              image: "assets/images/Pizza.jpg",
              title: "Pizza",
              description: "Delicious Cheese Pizza",
              price: 120,
              ingredients: [
                "Cheese",
                "Tomato Sauce",
                "Olives",
                "Pepper",
              ],
              sizes: {
                "Small": 0,
                "Medium": 25,
                "Large": 50,
              },
              addOns: {
                "Extra Cheese": 15,
                "Mushrooms": 10,
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}