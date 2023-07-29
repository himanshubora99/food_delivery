import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/presentation/food_details/widgets/cart_button.dart';
import 'package:food_delivery/src/presentation/food_details/widgets/toppings_widget.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:provider/provider.dart';

class SelectedFoodWidget extends StatelessWidget {
  const SelectedFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of(context, listen: false);
    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text( orderProvider.selectedOrder.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.alarm,
                      color: AppColors.red,
                    ),
                    Text('10-15 Mins',
                        style: TextStyle(
                          color: AppColors.grey,
                        )),
                  ],
                ),
              ],
            ),
            10.ph,
            const Text(
                'Grilled meat skewers, shish kebab and healthy to vegetable salad of fresh tomato cucumber',
                style: TextStyle(color: AppColors.grey)),
            20.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text('Topping for you',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                Text('Clear',
                    style: TextStyle(color: AppColors.red)),
              ],
            ),
            10.ph,
            const ToppingsWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Total price',
                        style: TextStyle(color: Colors.grey)),
                    Row(
                      children: const <Widget>[
                        Text('\u{20B9} ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                        Text('36.00',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                      ],
                    ),
                  ],
                ),
                const CartButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
