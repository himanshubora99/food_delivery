import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/fast_food_model.dart';
import 'package:food_delivery/src/models/fav_restaurant_model.dart';
import 'package:food_delivery/src/models/food_type_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<FoodType> foodTypeList = <FoodType>[
    FoodType(image: 'assets/pizza.png', name: 'Fast Food', isSelected: true),
    FoodType(image: 'assets/strawberry.png', name: 'Fruits', isSelected: false),
    FoodType(image: 'assets/drinks.png', name: 'Drinks', isSelected: false),
    FoodType(image: 'assets/food.png', name: 'Healthy', isSelected: false),
  ];
  List<FastFood> fastFoodList = <FastFood>[
    FastFood(
        image: 'assets/grilled_skewers.png',
        name: 'Grilled skewers',
        type: 'Spicy Mutton',
        isFavourite: true,
        quantity: 1,
        rating: 4,
        tax: 2,
        price: 36.00),
    FastFood(
        image: 'assets/thai_spaghetti.png',
        name: 'Thai Spaghetti',
        type: 'Fresh Tomato',
        isFavourite: false,
        quantity: 1,
        rating: 5,
        tax: 4,
        price: 12.00),
    FastFood(
        image: 'assets/margherita_pizza.png',
        name: 'Mar',
        type: 'Pizza',
        isFavourite: false,
        quantity: 1,
        rating: 3,
        tax: 1,
        price: 15.00),
    FastFood(
        image: 'assets/biryani.png',
        name: 'Biryani',
        type: 'Chicken',
        isFavourite: false,
        quantity: 1,
        rating: 2,
        tax: 3,
        price: 10.00),
  ];

  List<FavRestaurant> favRestaurantList = <FavRestaurant>[
    FavRestaurant(
        image: 'assets/biryani.png',
        name: 'Foodcave Restaurants',
        rating: 4,
        location: 'New York, Australia'),
    FavRestaurant(
        image: 'assets/thai_spaghetti.png',
        name: 'The Indian Grill',
        rating: 5,
        location: 'Hi-Tech City, Hyderabad'),
    FavRestaurant(
        image: 'assets/strawberry.png',
        name: 'Mughlai Darbar',
        rating: 2,
        location: 'Delhi, India'),
    FavRestaurant(
        image: 'assets/pizza.png',
        name: 'Shahi Darbar',
        rating: 4,
        location: 'Mumbai, India'),
  ];

  List<String> toppingsList = <String>[
    'assets/meat.png',
    'assets/broccoli.png',
    'assets/onion.png',
    'assets/tomato.png'
  ];

  void setCurrentFoodTypeSelected(int index) {
    for (final FoodType element in foodTypeList) {
      element.isSelected = false;
    }
    foodTypeList[index].isSelected = true;
    notifyListeners();
  }
  void setFoodFav(int index) {
    fastFoodList[index].isFavourite = !fastFoodList[index].isFavourite;
    notifyListeners();
  }
}
