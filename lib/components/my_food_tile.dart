import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    Key? key,
    required this.food,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Adjust font size as needed
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    food.description,
                    style: TextStyle(
                      fontSize: 8, // Make the description text smaller
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${food.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
              child: SizedBox(
                width: 80,
                height: 75,
                child: Image.asset(
                  food.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
