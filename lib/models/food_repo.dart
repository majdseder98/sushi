import 'package:equatable/equatable.dart';
import 'package:sushi/models/extra_model.dart';

class FoodRepo extends Equatable {
  final String name;
  final String price;
  final String image;
  final String dis;
  final String category;
  final String uid;
  final List<ExtraModel> extra;

  const FoodRepo(
      {required this.name,
      required this.price,
      required this.image,
      required this.dis,
      required this.category,
      required this.uid,
      required this.extra});

  @override
  List<Object> get props => [name, price, image, dis, category, uid, extra];
}
