

import 'package:sushi/models/extra_model.dart';
import 'package:sushi/models/food_repo.dart';

class FoodModel extends FoodRepo {
  const FoodModel(
      {required super.name,
      required super.price,
      required super.image,
      required super.dis,
      required super.category,
      required super.uid,
      required super.extra});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    final List<ExtraModel> list = [];
    final data = json['extra'];
    if (data is List) {
      list.clear();
      for (var element in data) {
        list.add(ExtraModel.fromJson(element));
      }
    }

    return FoodModel(
        name: json['name'],
        price: json['price'],
        uid: json['uid'],
        image: json['image'],
        category: json['category'],
        extra: list,
        dis: json['dis']);
  }

  toMap() => {
        "name": name,
        "price": price,
        "image": image,
        "dis": dis,
        "uid": uid,
        "category": category,
        "extra": extra.map((e) => e.toMap()).toList()
      };
}
