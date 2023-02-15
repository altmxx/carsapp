import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  String name;
  String id;
  int year;
  double mileage;

  int currYear = DateTime.now().year;

  VehicleCard({
    required this.id,
    required this.mileage,
    required this.name,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (mileage >= 15 && currYear - year <= 5)
              ? Colors.lightGreen
              : (mileage >= 15 && currYear - year > 5)
                  ? Colors.amber
                  : Colors.red[300],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mileage: $mileage'),
                Text('Purchase Year: $year'),
              ],
            )
          ],
        ));
  }
}
