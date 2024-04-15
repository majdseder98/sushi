
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sushi/models/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    
    
    Food(
      name: 'bhri poke',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/poke/bhripoke.jpg',
      price: 35,
      category: FoodCategory.poki,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    Food(
      name: 'chicken poke',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/poke/chickenpoke.jpg',
      price: 35,
      category: FoodCategory.poki,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    Food(
      name: 'salmon poke',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/poke/salmonpoke.jpg',
      price: 35,
      category: FoodCategory.poki,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    Food(
      name: 'shrimp poke',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/poke/shrmppoke.jpg',
      price: 35,
      category: FoodCategory.poki,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    Food(
      name: 'tuna poke',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/poke/tunapoke.jpg',
      price: 35,
      category: FoodCategory.poki,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    
    Food(
      name: 'beef mashroom',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/wok/beef mash.jpg',
      price: 35,
      category: FoodCategory.wok,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    Food(
      name: 'green carry',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/wok/green.jpg',
      price: 35,
      category: FoodCategory.wok,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    Food(
      name: 'pad thai',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/wok/pad thai.jpg',
      price: 35,
      category: FoodCategory.wok,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    Food(
      name: 'peaunt salmon',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/wok/peaunt.jpg',
      price: 35,
      category: FoodCategory.wok,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
    Food(
      name: 'red carry',
      description:
          'A delightful and warm treat consisting of fluffy stuffing wrapped around ',
      imagePath: 'lib/images/wok/red carry.jpg',
      price: 35,
      category: FoodCategory.wok,
      availableAddon: [
        Addon(name: 'extra', price: 8),
      ],
    ),
  
Food(
  name: 'Mix cup',
  description: 'A delightful and warm treat consisting of fluffy stuffing wrapped around',
  imagePath: 'lib/images/cup/mix cup.jpg',
  price: 35,
  category: FoodCategory.cup,
  availableAddon: [
    Addon(name: 'extra', price: 8),
  ],
),
Food(
  name: 'shrimp cup',
  description: 'A delightful and warm treat consisting of fluffy stuffing wrapped around',
  imagePath: 'lib/images/cup/shrimp.jpg',
  price: 35,
  category: FoodCategory.cup,
  availableAddon: [
    Addon(name: 'extra', price: 8),
  ],
)





  ];


List<Food> get Menu => _menu ;


  List<CartItem> get cart => _cart;



void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddon = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddon;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
      notifyListeners();
    }
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  List<CartItem> _cart = [];
}