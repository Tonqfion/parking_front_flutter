import 'package:flutter/material.dart';
import 'package:parking/features/guest/widgets/guest_bar.dart';

import 'features/profile/widgets/profile_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ProfileBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfileBar(),
      );
    case GuestBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GuestBar(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Ecran introuvable'),
          ),
        ),
      );
  }
}
