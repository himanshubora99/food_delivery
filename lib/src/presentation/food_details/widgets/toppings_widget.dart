import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class ToppingsWidget extends StatelessWidget {
  const ToppingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeScreenProvider = Provider.of(context, listen: false);
    return Row(
      children: List<Widget>.generate(
          homeScreenProvider.toppingsList.length,
          (int index) => Expanded(
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColors.darkBackground,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(homeScreenProvider.toppingsList[index]),
                ),
              )),
    );
  }
}
