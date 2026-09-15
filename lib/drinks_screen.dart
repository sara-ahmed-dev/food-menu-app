import 'package:flutter/material.dart';
import 'drink_item.dart';
import 'cart_screen.dart';
import 'cart_data.dart';

class DrinksScreen extends StatefulWidget {
  const DrinksScreen({super.key});

  @override
  State<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {
  String selectedCategory = "All";

  void addDrink({
    required String image,
    required String name,
    required double price,
  }) {
    CartData.addItem(
      image: image,
      name: name,
      price: price,
    );

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$name added to cart"),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Widget categoryButton(String category) {
    bool selected = selectedCategory == category;

    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: selected ? Colors.deepPurple : Colors.white,
          border: Border.all(
            color: selected ? Colors.deepPurple : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 14,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 26,
          ),
        ),
        title: const Text(
          "Drinks",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );

                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),

                if (CartData.totalQuantity > 0)
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "${CartData.totalQuantity}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryButton("All"),
                    const SizedBox(width: 10),
                    categoryButton("Juice"),
                    const SizedBox(width: 10),
                    categoryButton("Shake"),
                    const SizedBox(width: 10),
                    categoryButton("Coffee"),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              if (selectedCategory == "All" ||
                  selectedCategory == "Juice")
                DrinkItem(
                  image: "assets/images/orange.jpg",
                  name: "Orange Juice",
                  description: "Fresh orange juice",
                  price: "45 EGP",
                  onAdd: () {
                    addDrink(
                      image: "assets/images/orange.jpg",
                      name: "Orange Juice",
                      price: 45,
                    );
                  },
                ),

              if (selectedCategory == "All" ||
                  selectedCategory == "Juice")
                DrinkItem(
                  image: "assets/images/Lemon.jpg",
                  name: "Lemonade",
                  description: "Fresh lemon with mint",
                  price: "40 EGP",
                  onAdd: () {
                    addDrink(
                      image: "assets/images/Lemon.jpg",
                      name: "Lemonade",
                      price: 40,
                    );
                  },
                ),

              if (selectedCategory == "All" ||
                  selectedCategory == "Shake")
                DrinkItem(
                  image: "assets/images/falawra.jpg",
                  name: "Strawberry Shake",
                  description: "Strawberry with ice cream",
                  price: "60 EGP",
                  onAdd: () {
                    addDrink(
                      image: "assets/images/falawra.jpg",
                      name: "Strawberry Shake",
                      price: 60,
                    );
                  },
                ),

              if (selectedCategory == "All" ||
                  selectedCategory == "Coffee")
                DrinkItem(
                  image: "assets/images/icecoffe.jpg",
                  name: "Iced Coffee",
                  description: "Cold coffee with milk",
                  price: "55 EGP",
                  onAdd: () {
                    addDrink(
                      image: "assets/images/icecoffe.jpg",
                      name: "Iced Coffee",
                      price: 55,
                    );
                  },
                ),

              if (selectedCategory == "All" ||
                  selectedCategory == "Coffee")
                DrinkItem(
                  image: "assets/images/hotcho.jpg",
                  name: "Hot Chocolate",
                  description: "Rich hot chocolate",
                  price: "50 EGP",
                  onAdd: () {
                    addDrink(
                      image: "assets/images/hotcho.jpg",
                      name: "Hot Chocolate",
                      price: 50,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}