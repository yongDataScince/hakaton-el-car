import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      //page: RootScreen,
      initial: true,
      children: [
        // AutoRoute(page: , initial: true),
        //AutoRoute(page: ),
      ],
    ),
    AutoRoute(
        //page: ,
        // guards: [],
        ),
    // CustomRoute(
    //   page: InternetWarningScreen,
    //   transitionsBuilder: TransitionsBuilders.slideBottom,
    //   durationInMilliseconds: 300,
    // ),
    // CustomRoute(
    //   page: TrainingScreen,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    //   durationInMilliseconds: 250,
    // ),
  ],
)
class AppRouter extends _$AppRouter {}
