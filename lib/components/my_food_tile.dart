import 'package:flutter/material.dart';
import 'package:sushi/components/my_network_image.dart';
import 'package:sushi/extensions/size_on_context.dart';
import 'package:sushi/models/extra_model.dart';
import 'package:sushi/models/food_repo.dart';
import 'package:sushi/pages/food_page.dart';

class FoodTile extends StatelessWidget {
  final FoodRepo food;
  final List<ExtraModel> ons;

  const FoodTile({
    Key? key,
    required this.food,
    required this.ons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FoodPage(
            food: food,
          ),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Adjust font size as needed
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    food.dis,
                    style: const TextStyle(
                      fontSize: 12, // Make the description text smaller
                    ),
                  ),
                  const SizedBox(height: 5),
                 Text(
  '₪${food.price}',
  style: const TextStyle(
    fontWeight: FontWeight.bold,
  ),
),

                  if (ons.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (ons.isNotEmpty)
                    ListView.builder(
                      itemBuilder: (context, index) {
                        final extra = ons[index];

                        return OnsItem(extra: extra);
                      },
                      itemCount: ons.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: MyNetworkImage(
                image: food.image,
                height: context.height * 0.1,
                width: context.width * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
