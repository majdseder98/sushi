import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/components/my_network_image.dart';
import 'package:sushi/cubit/home_cubit.dart';
import 'package:sushi/cubit/home_state.dart';
import 'package:sushi/extensions/size_on_context.dart';
import 'package:sushi/extensions/snack_on_context.dart';
import 'package:sushi/models/extra_model.dart';
import 'package:sushi/models/food_repo.dart';

class FoodPage extends StatelessWidget {
  final FoodRepo food;

  const FoodPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          final list = cubit.map[food.uid] ?? cubit.ons;

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: MyNetworkImage(
                  image: food.image,
                  height: context.height * 0.3,
                  fit: BoxFit.fitWidth,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food name
                    Text(
                      food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    // Food price
                    Text(
                      food.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 10), // Food description
                    Text(
                      food.dis,
                    ),

                    const SizedBox(height: 10), // Add-ons

                    Divider(color: Theme.of(context).colorScheme.primary),

                    GestureDetector(
                      onTap: () {
                        if (food.extra.isNotEmpty &&
                            !cubit.isContain(food.uid)) {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: "d",
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    Dialog(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: SizedBox(
                                height: context.height * 0.3,
                                child: ListView.builder(
                                  itemCount: food.extra.length,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(16),
                                  itemBuilder: (context, index) {
                                    final extra = food.extra[index];

                                    return OnsItem(
                                      extra: extra,
                                      onTap: () {
                                        cubit.addOns(extra);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        } else {
                          context.showSnack("No Ons Available");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          cubit.isContain(food.uid) ? "Ons" : "Add-ons: ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        final extra = list[index];

                        return OnsItem(extra: extra);
                      },
                      itemCount: list.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),

                    const SizedBox(height: 10), // Add-ons
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.11,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: MyButton(
                    text: cubit.isContain(food.uid)
                        ? "Remove From Cart"
                        : "Add to cart",
                    onTap: () {
                      cubit.addToCart(food);
                    }),
              ), // Comma added here
            ],
          );
        },
      ),
    );
  }
}

class OnsItem extends StatelessWidget {
  const OnsItem({
    super.key,
    required this.extra,
    this.onTap,
  });

  final ExtraModel extra;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${extra.name} :  "),
            Text('\$${extra.price}'),
          ],
        ),
      ),
    );
  }
}
