import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi/components/loading.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/components/my_food_tile.dart';
import 'package:sushi/cubit/home_cubit.dart';
import 'package:sushi/cubit/home_state.dart';
import 'package:sushi/extensions/size_on_context.dart';
import 'package:sushi/extensions/snack_on_context.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          if (cubit.cart.isNotEmpty) {
            return Loading(
              condition: state is HomeSendFoodLoading,
              child: ListView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                primary: true,
                children: [
                  ListView.builder(
                    itemCount: cubit.cart.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final food = cubit.cart[index];
                      return FoodTile(
                        food: food.food,
                        ons: food.selectedAddons,
                      );
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  CheckOutButton(cubit: cubit),
                ],
              ),
            );
          } else {
            return const Center(
                child: Icon(
              Icons.shopping_cart_outlined,
              size: 70,
            ));
          }
        },
        listener: (BuildContext context, HomeState state) {
          if (state is HomeSendFoodSuccessfully) {
            context.showSnack("Your Order Check Successfully");
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Text(
                "Total Price : ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text("\$ ${cubit.totalPrice}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        MyButton(
          onTap: () {
            cubit.sendFood();
          },
          text: "Check Out",
        ),
      ],
    );
  }
}
