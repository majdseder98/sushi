import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi/components/cros_show.dart';
import 'package:sushi/components/loading.dart';
import 'package:sushi/components/my_drawer.dart';
import 'package:sushi/components/my_food_tile.dart';
import 'package:sushi/cubit/home_cubit.dart';
import 'package:sushi/cubit/home_state.dart';
import 'package:sushi/extensions/size_on_context.dart';
import 'package:sushi/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCartPage(),
                  ));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          final list = cubit.foods
              .where((element) => element.category == cubit.cats[cubit.index])
              .toList();
          return Loading(
            condition: state is HomeGetFoodLoading,
            child: ListView(
              children: [
                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("CaroseSlider")
                        .doc("LfB3x7XVTsSbJWSG0zQL")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var snap =
                            snapshot.data?.data() as Map<String, dynamic>;

                        return CorseShow(
                          hight: context.height * 0.2,
                          item: (index) {
                            var imagePath = snap["image"][index];
                            return CachedNetworkImage(
                              imageUrl: imagePath,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                            );
                          },
                          list: snap["image"] ?? [0],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: context.height * 0.09,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = cubit.cats[index];
                      return InkWell(
                        onTap: () {
                          cubit.selectCategory(index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 810),
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              border: cubit.index == index
                                  ? Border(
                                      bottom: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary))
                                  : null),
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.cats.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final food = list[index];
                    return FoodTile(
                      food: food,
                      ons: const [],
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
