import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/src/constants/app_colors.dart';
import 'package:food_delivery/src/providers/home_screen_provider.dart';
import 'package:food_delivery/src/providers/order_provider.dart';
import 'package:food_delivery/src/routes/router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<HomeScreenProvider>(
            create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        title: 'Food Delivery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.background),
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
