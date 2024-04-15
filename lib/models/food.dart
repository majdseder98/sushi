
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<Addon> availableAddon;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddon,
  });
}

enum FoodCategory {
  classicSushiRoll,
  wok,
  poki,
  asianBoa,
  cup,
  
}

class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });
}
