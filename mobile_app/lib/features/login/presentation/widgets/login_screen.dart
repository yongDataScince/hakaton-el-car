import 'package:flutter/material.dart';
import 'package:mobile_app/components/auth_button.dart';
import 'package:mobile_app/components/boxes/h_box.dart';
import 'package:mobile_app/components/change_auth_type.dart';
import 'package:mobile_app/components/custom_text_field.dart';
import 'package:mobile_app/features/login/domain/usecases/post_login.dart';
import 'package:mobile_app/features/login/presentation/store/auth_store.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? phone;
  String? password;

  @override
  Widget build(BuildContext context) {
    final store = context.read<AuthStore>();
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HBox(204),
          const Text(
            'Авторизация',
            style: TextStyle(fontSize: 20),
          ),
          const HBox(84),
          CustomTextField(
            hintText: 'Номер',
            onChanged: (value) => phone = value,
          ),
          const HBox(25),
          CustomTextField(
            hintText: 'Пароль',
            onChanged: (value) => password = value,
          ),
          const HBox(17),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthButton(
                onTap: () async {
                  // if (phone != null && password != null) {
                  await store.login(
                    LoginParams(
                      phone: '89180000000', // 89180000000
                      password: 'test123', // test123
                    ),
                  );
                  // }
                  // ignore: use_build_context_synchronously
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomeScreen()));
                },
              ),
              const HBox(10),
              const ChangeAuthMethod(),
            ],
          )
        ],
      ),
    );
  }
}
