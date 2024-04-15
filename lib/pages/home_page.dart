import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/my_current_location.dart';
import 'package:sushi/components/my_drawer.dart';
import 'package:sushi/components/my_food_tile.dart'; // Uncomment if necessary
import 'package:sushi/components/my_sliver_app_bar.dart';
import 'package:sushi/components/my_tab_bar.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/restaurant.dart';
import 'package:sushi/pages/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> _getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
  food: food,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodPage(food: food)),
    );
  },
);

        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  MyCurrentLocation(),
                ],
              ),
            ),
          ];
        },
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            return TabBarView(
              controller: _tabController,
              children: _getFoodInThisCategory(restaurant.Menu),
            );
          },
        ),
      ),
    );
  }
}
