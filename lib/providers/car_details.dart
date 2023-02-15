import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/car_detail.dart';

class CarDetails with ChangeNotifier {
  List<CarDetail> _cars = [];

  List<CarDetail> get cars {
    return [..._cars];
  }

  Future<void> fetchAndSetCars() async {
    Uri url = Uri.parse(
        'https://shopapp-bb32d-default-rtdb.asia-southeast1.firebasedatabase.app/Car.json');
    final response = await http.get(url);
    final List<CarDetail> loadedCars = [];
    // log(response.body.toString());
    final extractedData = jsonDecode(response.body) as List<dynamic>;
    if (extractedData == null) {
      return;
    }
    // log(extractedData.toString());
    for (int i = 0; i < extractedData.length; i++) {
      loadedCars.add(CarDetail(
        id: extractedData[i]['id'],
        name: extractedData[i]['name'],
        year: extractedData[i]['year'],
        mileage: extractedData[i]['mileage'],
      ));
    }
    _cars = loadedCars.toList();
    // log(loadedCars.toString());
    notifyListeners();
  }
}
