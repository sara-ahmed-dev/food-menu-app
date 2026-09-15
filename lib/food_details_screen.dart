import 'package:flutter/material.dart';
import 'cart_data.dart';
import 'cart_screen.dart';

class FoodDetailsScreen extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final double price;
  final List<String> ingredients;
  final Map<String, double> sizes;
  final Map<String, double> addOns;

  const FoodDetailsScreen({
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
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  String? selectedSize;
  final Set<String> selectedAddOns = {};
  int quantity = 1;

  @override
  void initState() {
    super.initState();

    if (widget.sizes.isNotEmpty) {
      selectedSize = widget.sizes.keys.first;
    }
  }

  double getSizePrice() {
    if (selectedSize == null) {
      return widget.price;
    }

    return widget.price + (widget.sizes[selectedSize] ?? 0);
  }

  double getSingleItemPrice() {
    double price = getSizePrice();

    for (final addOn in selectedAddOns) {
      price += widget.addOns[addOn] ?? 0;
    }

    return price;
  }

  double getFinalPrice() {
    return getSingleItemPrice() * quantity;
  }

  void addToCart() {
    String itemName = widget.title;

    if (selectedSize != null) {
      itemName += " - $selectedSize";
    }

    CartData.addItem(
      image: widget.image,
      name: itemName,
      price: getSingleItemPrice(),
      quantity: quantity,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${widget.title} added to cart"),
        duration: const Duration(seconds: 1),
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
          "Food Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 26,
            ),
          ),
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
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.white,
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "${getFinalPrice().toStringAsFixed(2)} EGP",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  if (widget.ingredients.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text(
                      "Ingredients",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.ingredients
                          .map((ingredient) => ingredientItem(ingredient))
                          .toList(),
                    ),
                  ],
                  if (widget.sizes.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text(
                      "Size",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: widget.sizes.keys
                          .map((size) => sizeButton(size))
                          .toList(),
                    ),
                  ],
                  if (widget.addOns.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text(
                      "Add-ons",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    ...widget.addOns.entries.map((entry) {
                      return Row(
                        children: [
                          Checkbox(
                            value: selectedAddOns.contains(entry.key),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedAddOns.add(entry.key);
                                } else {
                                  selectedAddOns.remove(entry.key);
                                }
                              });
                            },
                          ),
                          Expanded(
                            child: Text(entry.key),
                          ),
                          Text(
                            "+ ${entry.value.toStringAsFixed(0)} EGP",
                          ),
                        ],
                      );
                    }),
                  ],
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              "$quantity",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            onPressed: addToCart,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ingredientItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
  }

  Widget sizeButton(String size) {
    bool selected = selectedSize == size;

    return InkWell(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected ? Colors.deepPurple : Colors.white,
          border: Border.all(
            color: selected
                ? Colors.deepPurple
                : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}