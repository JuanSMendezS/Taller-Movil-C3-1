import 'package:actividad_c3_1/models/models.dart';
import 'package:actividad_c3_1/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const intialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'signin',
        icon: Icons.person_add_alt,
        name: 'Registro',
        screen: const Crud()),
    // MenuOption(
    //     route: 'list',
    //     icon: Icons.view_list,
    //     name: 'Temáticas',
    //     screen: const ListScreen()),
    // MenuOption(
    //     route: 'settings',
    //     icon: Icons.settings,
    //     name: 'Ajustes',
    //     screen: const AppSettingsScreen()),
    // MenuOption(
    //     route: 'login',
    //     icon: Icons.login,
    //     name: 'Inicio de Sesión',
    //     screen: const LogInScreen()),
    // MenuOption(
    //     route: 'alert',
    //     icon: Icons.ring_volume,
    //     name: 'Alertas',
    //     screen: const AlertScreen()),
    // MenuOption(
    //     route: 'avatar',
    //     icon: Icons.account_box,
    //     name: 'Avatar',
    //     screen: const AvatarScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    appRoutes
        .addAll({intialRoute: (BuildContext context) => const HomeScreen()});

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const ListviewScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  // };
}
