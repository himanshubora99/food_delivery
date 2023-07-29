import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/fast_food_model.dart';

class OrderProvider extends ChangeNotifier {
  List<FastFood> orderList = <FastFood>[];
  double totalTax = 0.0;
  double totalAmountWithoutTax = 0.0;
  double totalAmountWithTax = 0.0;

  late FastFood _selectedOrder;

  FastFood get selectedOrder => _selectedOrder;

  void setSelectedOrder(FastFood orderItem) {
    _selectedOrder = FastFood(
        image: orderItem.image,
        name: orderItem.name,
        type: orderItem.type,
        price: orderItem.price,
        quantity: orderItem.quantity,
        isFavourite: orderItem.isFavourite,
        rating: orderItem.rating,
        tax: orderItem.tax);
  }

  void setOrderFavourite(bool val) {
    _selectedOrder.isFavourite = val;
    notifyListeners();
  }

  void addOrder() {
    orderList.add(selectedOrder);
  }

  void increaseQuantity(FastFood orderItem) {
    final int currentQuantity = orderItem.quantity;
    orderItem.quantity = currentQuantity + 1;
    if(orderList.isNotEmpty){

      calculateAllAmounts();
    }
    notifyListeners();
  }

  void decreaseQuantity(FastFood orderItem) {
    final int currentQuantity = orderItem.quantity;
    orderItem.quantity = currentQuantity - 1;
    if (orderItem.quantity == 0 && orderList.isNotEmpty) {
      orderList.remove(orderItem);
      calculateAllAmounts();
    }
    notifyListeners();
  }

  void _calculateTotalTax() {
    double sum = 0.0;
    for (final FastFood element in orderList) {
      sum += (element.tax*element.quantity);
      print('element.tax:${element.tax}');
    }
    totalTax=sum;
    print('working33:${totalTax}');
  }

  void _calculateTotalAmountWithoutTax() {
    double sum = 0.0;
    for (final FastFood element in orderList) {
      print('element.price${element.price}||${element.quantity}');
      sum += element.price*element.quantity;
    }
    totalAmountWithoutTax = sum;
    print('totalAmountWithoutTax:${totalAmountWithoutTax}');
  }

  void _calculateTotalAmountWithTax() {
    print('_calculateTotalAmountWithTax:${totalTax}||$totalAmountWithoutTax');
    double totalSum = totalTax + totalAmountWithoutTax;
    totalAmountWithTax = totalSum;
  }

  void calculateAllAmounts(){
    _calculateTotalTax();
    _calculateTotalAmountWithoutTax();
    _calculateTotalAmountWithTax();
  }
}
