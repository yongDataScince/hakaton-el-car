import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/components/boxes/h_box.dart';
import 'package:mobile_app/core/constats/color_constants.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';

class CarWidget extends StatelessWidget {
  const CarWidget(this.car, {super.key});

  final CarEntity car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 5,
        top: 15,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.pinkCOlor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(children: [
        Image.asset(
          'assets/images/tesla_car.png',
          height: 100,
          width: 300,
          fit: BoxFit.contain,
        ),
        const HBox(24),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            car.carBrand,
            style: GoogleFonts.electrolize(
              fontSize: 24,
            ),
          ),
        ),
      ]),
    );
  }
}
