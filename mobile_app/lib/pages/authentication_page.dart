import 'package:flutter/material.dart';
import 'package:mobile_app/components/boxes/h_box.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

String url = 'https://klintsy.info/images/news/block/6897b.png';

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HBox(300),
          Text(
            'Войти через',
            style: TextStyle(fontSize: 28),
          ),
          HBox(15),
          Container(
            alignment: Alignment.center,
            height: 150,
            width: 420,
            child: Card(
                child: GestureDetector(
              child: Image.network(url),
              onTap: () {
                Navigator.pushNamed(context, '/main');
              },
            )),
          ),
        ],
      ),
    );
  }
}
