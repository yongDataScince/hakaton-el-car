import 'package:flutter/material.dart';
import 'package:mobile_app/components/auth_button.dart';
import 'package:mobile_app/components/boxes/h_box.dart';
import 'package:mobile_app/components/custom_text_field.dart';
import 'package:mobile_app/features/login/domain/usecases/post_login.dart';
import 'package:mobile_app/features/login/presentation/store/auth_store.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? phone;
  String? password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = context.read<AuthStore>();
    return Center(
      child: Form(
        key: _formKey,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите что-то';
                }
                phone = value;
                return null;
              },
            ),
            const HBox(15),
            CustomTextField(
              hintText: 'Пароль',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите что-то';
                }
                password = value;
                return null;
              },
            ),
            const HBox(17),
            AuthButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await store.login(
                    LoginParams(
                      phone: phone!,
                      password: password!,
                    ),
                  );
                }
              },
            ),
            const HBox(15),
            AuthButton(
              customText: 'Войти без рег. (тест)',
              onTap: () async {
                await store.login(
                  LoginParams(
                    phone: '89180000000',
                    password: 'test123',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
