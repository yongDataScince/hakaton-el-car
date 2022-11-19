import 'package:flutter/material.dart';
import 'package:mobile_app/components/boxes/h_box.dart';
import 'package:mobile_app/components/boxes/w_box.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HBox(50),
          BackPage(),
          HBox(10),
          InfoAndPic(),
          HBox(420),
          LeaveButton(),
        ],
      ),
    );
  }
}

class BackPage extends StatelessWidget {
  const BackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 350, top: 30, left: 20),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
        color: Color.fromARGB(255, 221, 228, 231),
      ),
      child: IconButton(
        icon: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class InfoAndPic extends StatelessWidget {
  const InfoAndPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 150,
            height: 150,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.person,
                size: 100,
              ),
              color: Colors.yellow.shade200,
            )),
        HBox(20),
        Text(
          'Минасов Эрик',
          style: TextStyle(fontSize: 28),
        )
      ],
    );
  }
}

class LeaveButton extends StatelessWidget {
  const LeaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black87),
          color: Colors.black,
        ),
        alignment: Alignment.center,
        width: 240,
        height: 60,
        child: Row(
          children: [
            WBox(20),
            Text(
              'Выйти',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            WBox(105),
            Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 35,
            )
          ],
        ),
      ),
      onTap: () =>
          Navigator.popUntil(context, (route) => route.settings.name == "/reg"),
    );
  }
}
