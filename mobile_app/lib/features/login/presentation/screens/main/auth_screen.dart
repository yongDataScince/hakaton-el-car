import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app/components/failed_widget.dart';
import 'package:mobile_app/components/standart_loading.dart';
import 'package:mobile_app/features/cars_list/presentation/screens/main/car_list_screen.dart';
import 'package:mobile_app/features/login/presentation/screens/states/auth_loaded.dart';
import 'package:mobile_app/features/login/presentation/store/auth_store.dart';
import 'package:mobile_app/utilities/load_states.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/services/di/locator_service.dart' as di;

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final authStore = di.getIt.get<AuthStore>();

  @override
  void initState() {
    authStore.navigationPush = () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    };
    authStore.showWrongLoginOrPassword = () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Неверный логин или пароль'),
        ),
      );
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<AuthStore>(
          create: (context) => authStore,
          builder: (context, _) {
            return Observer(builder: (context) {
              if (authStore.loadState == LoadStates.successful) {
                return const AuthLoginScreen();
              }
              if (authStore.loadState == LoadStates.failed) {
                return const FailedWidget();
              }
              if (authStore.loadState == LoadStates.loading) {
                return const StandartLoading();
              }
              if (authStore.loadState == LoadStates.empty) {
                return const Center(
                  child: Text('Empty'),
                );
              }
              return Container();
            });
          }),
    );
  }
}
