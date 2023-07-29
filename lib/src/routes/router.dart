import 'package:flutter/material.dart';
import 'package:food_delivery/src/presentation/cart_view/cart.dart';
import 'package:food_delivery/src/presentation/food_details/selected_food_details.dart';
import 'package:food_delivery/src/presentation/main_dashboard.dart';

class Routers {
  static const String mainDashboard = '/mainDashboard';
  static const String selectedFood = '/selectedFood';
  static const String cart = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainDashboard:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: mainDashboard),
          builder: (BuildContext context) {
            return const MainDashboard();
          },
        );
      case selectedFood:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: selectedFood),
          builder: (BuildContext context) {
            return const SelectedFoodDetails();
          },
        );
      case cart:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: cart),
          builder: (BuildContext context) {
            return const Cart();
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
      return const MainDashboard();
      // return CommonDeviceSplashScreen();
      // return FaceNotFoundScreen();
    });
  }
}
