import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:provider/provider.dart';

class QuantityIncreaseRow extends StatelessWidget {
  const QuantityIncreaseRow({super.key});

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          surfaceTintColor: AppColors.white,
          child: SizedBox(
            width: 70,
            height: 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Icon(
                    Icons.star,
                    color: AppColors.gold,
                  ),
                  Text(orderProvider.selectedOrder.rating.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.grey))
                ]),
          ),
        ),
        Card(
          surfaceTintColor: AppColors.yellow,
          color: AppColors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 40,
            child: Row(children: <Widget>[
              10.pw,
              InkWell(
                onTap: () {
                  orderProvider.decreaseQuantity(orderProvider.selectedOrder);
                  if (orderProvider.selectedOrder.quantity == 0) {
                    Navigator.pop(context);
                  }
                },
                child: const Icon(
                  Icons.remove,
                  color: AppColors.black,
                ),
              ),
              10.pw,
              Selector<OrderProvider, Object>(
                selector: (BuildContext context, OrderProvider provider) =>
                    orderProvider.selectedOrder.quantity,
                builder: (BuildContext context, Object value, Widget? child) {
                  return Text(
                      orderProvider.selectedOrder.quantity
                          .toString()
                          .padLeft(2, '0'),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18));
                },
              ),
              10.pw,
              InkWell(
                onTap: () {
                  orderProvider.increaseQuantity(orderProvider.selectedOrder);
                },
                child: const Icon(
                  Icons.add,
                  color: AppColors.black,
                ),
              ),
              10.pw,
            ]),
          ),
        ),
      ],
    );
  }
}
