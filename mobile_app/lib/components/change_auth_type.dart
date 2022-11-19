import 'package:flutter/material.dart';
import 'package:mobile_app/features/login/presentation/store/auth_store.dart';
import 'package:provider/provider.dart';

class ChangeAuthMethod extends StatelessWidget {
  const ChangeAuthMethod({super.key});

  final TextStyle tappedTextStyle = const TextStyle(color: Colors.lightBlue);

  @override
  Widget build(BuildContext context) {
    final store = context.read<AuthStore>();
    return store.authTypeIsLogin
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Нет аккаунта? '),
              TextButton(
                onPressed: () {
                  store.authTypeIsLogin = false;
                },
                child: Text(
                  'Зарегестрироваться',
                  style: tappedTextStyle,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Есть аккаунт? '),
              TextButton(
                onPressed: () {
                  store.authTypeIsLogin = true;
                },
                child: Text(
                  'Войти',
                  style: tappedTextStyle,
                ),
              ),
            ],
          );
  }
}
