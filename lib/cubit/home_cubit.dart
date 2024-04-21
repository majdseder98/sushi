import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi/core/user.dart';
import 'package:sushi/cubit/home_state.dart';
import 'package:sushi/models/cart_item.dart';
import 'package:sushi/models/check_out_model.dart';
import 'package:sushi/models/extra_model.dart';
import 'package:sushi/models/food_model.dart';
import 'package:sushi/models/food_repo.dart';
import 'package:uuid/uuid.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final List<String> cats = [
    "classicSushiRoll",
    "wok",
    "poki",
    "asianBoa",
    "cup",
    "classicSushiRoll",
    "wok",
    "poki",
    "asianBoa",
    "cup",
  ];
  int index = 0;
  void selectCategory(int id) {
    emit(HomeInitial());
    index = id;
    emit(HomeChangeIndex());
  }

  List<FoodRepo> foods = [];
  Future getFood() async {
    emit(HomeGetFoodLoading());
    try {
      final response = await firebaseFirestore.collection("food").get();
      foods.clear();
      for (var element in response.docs) {
        foods.add(FoodModel.fromJson(element.data()));
      }
      emit(HomeGetFoodSuccessfully());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(HomeGetFoodError());
    }
  }

  final List<ExtraModel> ons = [];
  void addOns(ExtraModel model) {
    emit(HomeInitial());
    ons.add(model);
    emit(HomeAddOns());
  }

  final List<CartItem> cart = [];
  final Map<String, List<ExtraModel>> map = {};
  bool isContain(String id) => cart.any((element) => element.id == id);
  void addToCart(FoodRepo food) {
    emit(HomeInitial());

    // Create a copy of the ons list
    final List<ExtraModel> list = List.from(ons);
    final item = CartItem(food: food, selectedAddons: list, id: food.uid);

    if (!isContain(item.id)) {
      cart.add(item);
      map[food.uid] = list;
    } else {
      cart.removeWhere((element) => element.id == item.id);
      map.remove(item.id); // No need for removeWhere if you are removing by key
    }

    // Clear the original ons list after using the copy
    ons.clear();
    emit(HomeAddToCart());
  }

  double get totalPrice {
    double total = 0;
    for (var element in cart) {
      total += element.totalPrice;
    }
    return total;
  }

  Future sendFood() async {
    emit(HomeSendFoodLoading());
    try {
      final id = const Uuid().v4();
      final model = CheckOutModel(
          cart: cart,
          totalPrice: totalPrice,
          userId: UserData.uid ?? "",
          id: id);
      await firebaseFirestore.collection("CheckOut").doc(id).set(model.toMap());
      cart.clear();
      map.clear();
      emit(HomeSendFoodSuccessfully());
    } on FirebaseException catch (e) {
      debugPrint(e.message.toString());
      emit(HomeSendFoodError());
    }
  }
}
