import 'package:flutter/material.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:food_delivery/src/routes/router.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        OrderProvider orderProvider = Provider.of(context, listen: false);
        orderProvider.addOrder();
        Navigator.pushReplacementNamed(
          context,
          Routers.cart,
        );
      },
      child: Card(
        color: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: const <Widget>[
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                Text(
                  'Go To Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
