import 'package:sushi/models/extra_model.dart';
import 'package:sushi/models/food_model.dart';
import 'package:sushi/models/food_repo.dart';

class CartItem {
  FoodRepo food;
  List<ExtraModel> selectedAddons;
  final String id;

  CartItem(
      {required this.food, required this.selectedAddons, required this.id});

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + double.parse(addon.price));
    return (double.parse(food.price) + addonsPrice);
  }

  toMap() {
    final model = FoodModel(
        name: food.name,
        price: food.price,
        image: food.image,
        dis: food.dis,
        category: food.category,
        uid: food.uid,
        extra: food.extra);

    return {
      "foods": model.toMap(),
      "extra": selectedAddons.map((e) => e.toMap()).toList()
    };
  }
}
