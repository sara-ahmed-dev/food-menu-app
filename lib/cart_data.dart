class CartProduct {
  final String image;
  final String name;
  final double price;
  int quantity;

  CartProduct({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartData {
  static List<CartProduct> items = [];

  static void addItem({
    required String image,
    required String name,
    required double price,
    int quantity = 1,
  }) {
    int index = items.indexWhere(
          (item) => item.name == name && item.price == price,
    );

    if (index != -1) {
      items[index].quantity += quantity;
    } else {
      items.add(
        CartProduct(
          image: image,
          name: name,
          price: price,
          quantity: quantity,
        ),
      );
    }
  }

  static void increaseQuantity(int index) {
    items[index].quantity++;
  }

  static void decreaseQuantity(int index) {
    if (items[index].quantity > 1) {
      items[index].quantity--;
    } else {
      items.removeAt(index);
    }
  }

  static int get totalQuantity {
    int total = 0;

    for (var item in items) {
      total += item.quantity;
    }

    return total;
  }

  static double get subtotal {
    double total = 0;

    for (var item in items) {
      total += item.price * item.quantity;
    }

    return total;
  }
}