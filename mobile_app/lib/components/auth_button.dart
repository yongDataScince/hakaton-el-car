import 'package:flutter/material.dart';
import 'package:mobile_app/core/constats/color_constants.dart';
import 'package:mobile_app/features/login/presentation/store/auth_store.dart';
import 'package:provider/provider.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.customText,
    required this.onTap,
  });

  final String? customText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final store = context.read<AuthStore>();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.pinkCOlor,
        ),
        alignment: Alignment.center,
        child: Text(
          customText ??
              (store.authTypeIsLogin ? 'Войти' : 'Зарегистрироваться'),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
