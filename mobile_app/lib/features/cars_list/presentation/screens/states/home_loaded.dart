import 'package:flutter/material.dart';
import 'package:mobile_app/components/boxes/h_box.dart';
import 'package:mobile_app/components/custom_text_field.dart';
import 'package:mobile_app/features/cars_list/presentation/screens/main/add_car_screen.dart';
import 'package:mobile_app/features/cars_list/presentation/store/user_store.dart';
import 'package:mobile_app/features/cars_list/presentation/widgets/add_car_button.dart';
import 'package:mobile_app/features/cars_list/presentation/widgets/car_widget.dart';
import 'package:provider/provider.dart';

class HomeScreenLoaded extends StatelessWidget {
  const HomeScreenLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<UserStore>();
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextField(
                width: 290,
                hintText: '🔍 Поиск',
              ),
              GestureDetector(
                child: const AddCarButton(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const AddCarScreen(),
                    ),
                  )
                      // .then((_) => store.loadEntity())
                      ;
                },
              ),
            ],
          ),
          const HBox(30),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: store.entity!.length,
            itemBuilder: (context, index) => CarWidget(store.entity![index]),
            separatorBuilder: (context, index) => const HBox(30),
          ),
        ],
      ),
    );
  }
}
