import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/features/cars_list/presentation/store/user_store.dart';
import 'package:provider/provider.dart';

class HomeScreenLoaded extends StatelessWidget {
  const HomeScreenLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<UserStore>();
    return Center(
      child: Column(
        children: store.entity!.map((car) => Text(car.carBrand)).toList(),
      ),
    );
  }
}
