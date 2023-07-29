import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class FavouriteRestaurant extends StatelessWidget {
  const FavouriteRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeScreenProvider = Provider.of(context, listen: false);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List<Widget>.generate(
              homeScreenProvider.favRestaurantList.length,
              (int index) => fastRestaurantCard(
                  image: homeScreenProvider.favRestaurantList[index].image,
                  name: homeScreenProvider.favRestaurantList[index].name,
                  rating: homeScreenProvider.favRestaurantList[index].rating,
                  location:
                      homeScreenProvider.favRestaurantList[index].location))),
    );
  }

  Widget fastRestaurantCard({
    required String image,
    required String name,
    required int rating,
    required String location,
  }) {
    return Card(
      surfaceTintColor: Colors.white,
      child: SizedBox(
        height: 140,
        width: 260,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(image))),
                // child: Image.asset(image),
              ),
              10.pw,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Row(
                      children: List<Widget>.generate(5, (int index) {
                        if (rating >= index) {
                          return const Icon(
                            Icons.star,
                            size: 15,
                            color: AppColors.gold,
                          );
                        } else {
                          return const Icon(
                            Icons.star_border,
                            size: 15,
                          );
                        }
                      }),
                    ),
                    Text(location,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
