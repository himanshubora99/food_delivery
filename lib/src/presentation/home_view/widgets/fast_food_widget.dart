import 'package:flutter/material.dart';
import 'package:food_delivery/src/providers/home_screen_provider.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:food_delivery/src/routes/router.dart';
import 'package:provider/provider.dart';

class FastFoodWidget extends StatelessWidget {
  const FastFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<HomeScreenProvider>(
        builder:
            (BuildContext context, HomeScreenProvider provider, Widget? child) {
          return Row(
              children: List<Widget>.generate(
                  provider.fastFoodList.length,
                  (int index) => InkWell(
                        onTap: () {
                          OrderProvider orderProvider =
                              Provider.of(context, listen: false);
                          orderProvider
                              .setSelectedOrder(provider.fastFoodList[index]);
                          Navigator.pushNamed(
                            context,
                            Routers.selectedFood,
                          );
                        },
                        child: fastFoodCard(
                            type: provider.fastFoodList[index].type,
                            name: provider.fastFoodList[index].name,
                            image: provider.fastFoodList[index].image,
                            isFav: provider.fastFoodList[index].isFavourite,
                            price: provider.fastFoodList[index].price,
                            onTapFav: () {
                              provider.setFoodFav(index);
                            }),
                      )));
        },
      ),
    );
  }

  Widget fastFoodCard({
    required String image,
    required String name,
    required String type,
    required double price,
    required bool isFav,
    required void Function()? onTapFav,
  }) {
    return Card(
      surfaceTintColor: Colors.white,
      child: SizedBox(
        width: 170,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 120,
                child: Image.asset(image),
              ),
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18)),
              Text(type, style: const TextStyle(color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('\$ $price',
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  InkWell(
                    onTap: onTapFav,
                    child: Icon(
                      isFav ? Icons.favorite_outlined : Icons.favorite_outline,
                      color: isFav ? Colors.red : null,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
