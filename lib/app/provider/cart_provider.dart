import 'package:flutter/material.dart';
import "../model/product.dart";

class CartProvider with ChangeNotifier{

  List<Product> _products = [];

  double totalPrice = 0.0;


  void addProduct (Product product) {
    _products.add(product);
    totalPrice += product.price;
    notifyListeners();
  }

  void removeProduct (Product product) {
    _products.remove(product);
    totalPrice -= product.price;
    notifyListeners();
  }

  int get productLength {
    return _products.length ?? 0;
  }

  List<Product> get allProduct {
    return _products ?? [];
  }

  double get calcTax {
    return (totalPrice * 15) / 100;
  }

  double get allPrice {
    return totalPrice + calcTax;
  }

}