import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';

class CarScreen extends StatelessWidget {
  const CarScreen(this.car, {super.key});

  final CarEntity car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.carBrand),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/tesla_car.png',
          ),
          Text(car.enginePowerHp.toString()),
          Text(car.releaseYear.toString()),
          Text(car.bodyColor),
          Text('Battery capacity: ${car.batteryCapacity}'),
        ],
      ),
    );
  }
}
