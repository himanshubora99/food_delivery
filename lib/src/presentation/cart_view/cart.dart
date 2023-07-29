import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/presentation/cart_view/widgets/amount_details_widget.dart';
import 'package:food_delivery/src/presentation/cart_view/widgets/order_list_widget.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    OrderProvider initOrderProvider = Provider.of(context, listen: false);

    setState(() {
      initOrderProvider.calculateAllAmounts();
    });
  }

  @override
  Widget build(BuildContext context) {
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
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.delete_outline,
              color: Colors.black,
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: MediaQuery.of(context).size.height / 1.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('My',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                  const Text('Cart List',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: AppColors.paleSky)),
                  20.ph,
                  const Expanded(child: OrderListWidget()),
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.percent, color: AppColors.red),
                      10.pw,
                      const Text('Do you have any discount code?')
                    ],
                  ),
                  20.ph,
                ],
              )),
          const Expanded(
            child: AmountDetails(),
          ),
        ],
      ),
    );
  }
}
