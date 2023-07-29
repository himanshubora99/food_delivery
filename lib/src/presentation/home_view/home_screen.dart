import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/presentation/home_view/widgets/fast_food_widget.dart';
import 'package:food_delivery/src/presentation/home_view/widgets/favourite_restaurant_widget.dart';
import 'package:food_delivery/src/presentation/home_view/widgets/food_types_widget.dart';
import 'package:food_delivery/src/presentation/home_view/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: AppColors.darkBackground,
        leading: const Icon(Icons.menu),
        title: const Text('Search Food',
            style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/profile_user.png'),
                  fit: BoxFit.cover,
                )),
            height: 40,
            width: 40,
            // child: Image.asset('assets/profile_user.png',fit: BoxFit.fill),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: <Widget>[
                const Flexible(
                    child: SearchField()),
                10.pw,
                const Card(
                  surfaceTintColor: Colors.white,
                  child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.filter_list_outlined)),
                ),
              ],
            ),
          ),
          30.ph,
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    const FoodTypeWidget(),
                    30.ph,
                    const FastFoodWidget(),
                    30.ph,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            'Favourite Restaurants',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          )
                        ]),
                    30.ph,
                    const FavouriteRestaurant(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
