import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/vehicle_card.dart';
import '../models/car_detail.dart';

import '../providers/car_details.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  late Future _carsFuture;

  Future _obtainCarsFuture() {
    return Provider.of<CarDetails>(context, listen: false).fetchAndSetCars();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carsFuture = _obtainCarsFuture();
  }

  @override
  Widget build(BuildContext context) {
    List<CarDetail> availableCars = Provider.of<CarDetails>(context).cars;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Fuel Efficiency of Vehicles',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // VehicleCard(id: 1, mileage: 20.7, name: 'Aventador', year: 2020)
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return VehicleCard(
                      id: availableCars[i].id,
                      mileage: availableCars[i].mileage,
                      name: availableCars[i].name,
                      year: availableCars[i].year);
                },
                itemCount: availableCars.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
