import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app/features/login/presentation/store/auth_store.dart';
import 'package:mobile_app/features/login/presentation/widgets/login_screen.dart';
import 'package:mobile_app/features/login/presentation/widgets/register_screen.dart';
import 'package:provider/provider.dart';

class AuthLoginScreen extends StatelessWidget {
  const AuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<AuthStore>();
    return Observer(
      builder: (context) =>
          store.authTypeIsLogin ? LoginScreen() : RegisterScreen(),
    );
  }
}
