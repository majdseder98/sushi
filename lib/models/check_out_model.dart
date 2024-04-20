import 'package:sushi/models/cart_item.dart';

class CheckOutModel {
  final List<CartItem> cart;
  final double totalPrice;
  final String userId;
  final String id;

  CheckOutModel(
      {required this.cart,
      required this.totalPrice,
      required this.userId,
      required this.id});

  toMap() => {
        "cart": cart.map((e) => e.toMap()).toList(),
        "totalPrice": totalPrice,
        "userId": userId,
        "id": id
      };
}
