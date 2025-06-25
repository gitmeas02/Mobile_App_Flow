class CartItem {
  final double price;
  final String name;
  final String descriptions;
  final String image;
  final int capacities;

  CartItem({
    required this.price,
    required this.name,
    required this.descriptions,
    required this.image,
    required this.capacities,
  });
}
List<CartItem> cartItems = [];
