import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/presentation/cart_view/cart.dart';
import 'package:food_delivery/src/presentation/food_details/widgets/cart_button.dart';
import 'package:food_delivery/src/presentation/food_details/widgets/quantity_increase_row.dart';
import 'package:food_delivery/src/presentation/food_details/widgets/selected_food_details.dart';
import 'package:food_delivery/src/presentation/food_details/widgets/toppings_widget.dart';
import 'package:food_delivery/src/providers/home_screen_provider.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:provider/provider.dart';

class SelectedFoodDetails extends StatefulWidget {
  const SelectedFoodDetails({super.key});

  @override
  State<SelectedFoodDetails> createState() => _SelectedFoodDetailsState();
}

class _SelectedFoodDetailsState extends State<SelectedFoodDetails> {
  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        surfaceTintColor: AppColors.darkBackground,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Card(
            surfaceTintColor: Colors.white,
            child: SizedBox(
                height: 30, width: 30, child: Icon(Icons.arrow_back_ios)),
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Selector<OrderProvider, Object>(
                selector: (BuildContext context, OrderProvider provider) =>
                    orderProvider.selectedOrder.isFavourite,
                builder: (BuildContext context, Object value, Widget? child) {
                  return InkWell(
                    onTap: () {
                      orderProvider.setOrderFavourite(
                          !orderProvider.selectedOrder.isFavourite);
                    },
                    child: Icon(
                      orderProvider.selectedOrder.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: orderProvider.selectedOrder.isFavourite
                          ? Colors.red
                          : null,
                    ),
                  );
                },
              ))
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: MediaQuery.of(context).size.height / 2.5,
            child: Image.asset(orderProvider.selectedOrder.image),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SelectedFoodWidget(),
                ),
                QuantityIncreaseRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
