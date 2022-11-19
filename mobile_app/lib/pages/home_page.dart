import 'package:flutter/material.dart';
import 'package:mobile_app/components/boxes/h_box.dart';
import 'package:mobile_app/components/boxes/w_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HBox(65),
          TextBar(),
          const HBox(25),
          fieldWithAdd(),
          const HBox(35),
          vehicleCard(),
          const HBox(15),
          vehicleCard(),
        ],
      ),
    );
  }
}

class TextBar extends StatelessWidget {
  const TextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 135),
            child: const Text(
              'Electro Car-D',
              style: TextStyle(fontSize: 25),
            )),
        Container(
          padding: const EdgeInsets.only(left: 70),
          child: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/user', (route) => true);
            },
          ),
        )
      ],
    );
  }
}

Widget fieldWithAdd() {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 35),
        height: 50,
        width: 350,
        child: TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 221, 228, 231),
            hintText: 'Поиск',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 22),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ),
      const WBox(10),
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white),
            color: Color.fromARGB(255, 221, 228, 231),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_outlined,
              size: 30,
              color: Colors.white,
            ),
          ))
    ],
  );
}

Widget vehicleCard() {
  return Container(
    height: 180,
    width: 400,
    child: Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      color: Colors.brown.shade100,
      child: cardDetails(),
    ),
  );
}

Widget cardDetails() {
  return Column(
    children: [
      const Icon(
        Icons.car_repair,
        size: 100,
      ),
      const HBox(30),
      Row(
        children: [
          const WBox(15),
          const Text(
            'Tesla Model S',
            style: TextStyle(fontSize: 28),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 5,
              left: 110,
            ),
            child: Material(
              color: Colors.blueGrey[300],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(25),
              ),
              child: const InkWell(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("251 л.с.",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
