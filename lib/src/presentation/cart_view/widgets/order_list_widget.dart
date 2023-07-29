import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/models/fast_food_model.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (BuildContext context, OrderProvider provider,
          Widget? child) {
        if (provider.orderList.isEmpty) {
          return const Center(
              child: Text('Please add items to cart'));
        }
        return ListView.builder(
            itemCount: provider.orderList.length,
            itemBuilder: (BuildContext context, int index) {
              FastFood order = provider.orderList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(order.image),
                          ),
                          10.pw,
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(order.name),
                              Text(
                                  '\$${order.price} x${order.quantity}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  provider
                                      .increaseQuantity(order);
                                },
                                child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.glass,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  provider
                                      .decreaseQuantity(order);
                                },
                                child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
