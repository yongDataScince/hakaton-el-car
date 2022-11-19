import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/core/builders/entity_builder.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';
import 'package:mobile_app/features/cars_list/presentation/screens/states/home_loaded.dart';
import 'package:mobile_app/features/cars_list/presentation/store/user_store.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/services/di/locator_service.dart' as di;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userStore = di.getIt.get<UserStore>();

  @override
  void initState() {
    userStore.getCarsFromUser(UserParams(phone: '89180000000'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car-D',
          style: GoogleFonts.balooChettan2(),
        ),
      ),
      body: Provider<UserStore>(
        create: (context) => userStore,
        builder: (context, _) {
          return const EntityBuilder<UserStore>(
            loadedWidget: HomeScreenLoaded(),
          );
        },
      ),
    );
  }
}
