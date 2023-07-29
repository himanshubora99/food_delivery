import 'package:flutter/material.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/helper/extensions.dart';
import 'package:food_delivery/src/presentation/cart_view/widgets/checkout_button.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:food_delivery/src/widgets/dotted_divider.dart';
import 'package:provider/provider.dart';

class AmountDetails extends StatelessWidget {
  const AmountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (BuildContext context, OrderProvider provider,
          Widget? child) {
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
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 20),
            child: Column(
              children: <Widget>[
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('SubTotal',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.grey)),
                    Text('\$ ${provider.totalAmountWithoutTax}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.grey))
                  ],
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Est.Tax',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.grey)),
                    Text('${provider.totalTax}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.grey))
                  ],
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text('Delivery',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.grey)),
                    Text('Free',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.grey))
                  ],
                ),
                10.ph,
                const DottedDivider(
                  gapWidth: 4,
                  strokeWidth: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Total',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                    Text('\$ ${provider.totalAmountWithTax}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20))
                  ],
                ),
                10.ph,
                const Spacer(),
                const CheckOutButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
