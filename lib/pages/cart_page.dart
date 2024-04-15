import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/components/my_cart_tile.dart';
import 'package:sushi/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear the cart?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.clear),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      final cartItem = userCart[index];
                      return MyCarTile(cartItem: cartItem);
                    },
                  ),
                ),
              ),
MyButton(onTap: () {},
text: "checkout",),
const SizedBox(height: 25,),   

         ],
            
          ),
         
        );
      },
    );
  }
}
