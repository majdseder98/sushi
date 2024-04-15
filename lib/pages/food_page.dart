
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({Key? key, required this.food}) : super(key: key) {
    for (Addon addon in food.availableAddon) {
      selectedAddons[addon] = false;
    }
  }

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
 void addToCart(Food food, Map<Addon, bool> selectedAddons) {

  Navigator.pop(context);
  List<Addon> currentlySelectedAddons = [];

  // Iterate over available addons and check if they are selected
  for (Addon addon in food.availableAddon) {
    if (selectedAddons[addon] == true) { // Checking if the addon is selected
      currentlySelectedAddons.add(addon);
    }
  }

  // Adding the selected food with addons to the cart
  context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Food image
            Image.asset(widget.food.imagePath),
        
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food name
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
        
                  // Food price
                  Text(
                    widget.food.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
        
                  const SizedBox(height: 10), // Food description
                  Text(
                    widget.food.description,
                  ),
        
                  const SizedBox(height: 10), // Add-ons
        
                  Divider(color: Theme.of(context).colorScheme.secondary),
        
                  const SizedBox(height: 10), // Add-ons
        
                  Text(
                    "Add-ons",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        
                  const SizedBox(height: 10), // Add-ons
        
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddon.length,
                      itemBuilder: (context, index) {
                        Addon addon = widget.food.availableAddon[index];
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(addon.price.toString()),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        
            MyButton(text: "Add to cart", onTap: ()=> addToCart(widget.food, widget.selectedAddons)), // Comma added here
            const SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}
