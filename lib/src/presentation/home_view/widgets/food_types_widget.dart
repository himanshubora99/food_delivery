import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class FoodTypeWidget extends StatelessWidget {
  const FoodTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<HomeScreenProvider>(
        builder: (BuildContext context,
            HomeScreenProvider provider, Widget? child) {
          return Row(
            children: List<Widget>.generate(
                provider.foodTypeList.length,
                    (int index) => Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10),
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: provider
                          .foodTypeList[index]
                          .isSelected ==
                          true
                          ? Colors.yellow
                          : AppColors.darkBackground,
                      borderRadius:
                      BorderRadius.circular(25)),
                  child: InkWell(
                    onTap: () {
                      provider
                          .setCurrentFoodTypeSelected(
                          index);
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                              left: 5),
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white),
                          child: Image.asset(
                              provider
                                  .foodTypeList[index]
                                  .image),
                        ),
                        10.pw,
                        Text(
                          provider
                              .foodTypeList[index].name,
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
