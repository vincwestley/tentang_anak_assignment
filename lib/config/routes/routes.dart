import 'package:flutter/cupertino.dart';
import 'package:flutter_take_home_test/lib.dart';

/// Navigation Class
const routeDashboard = "/";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    //List modules route
    case routeDashboard:
      return CupertinoPageRoute(
        builder: (context) => const DashboardScreen(),
      );
  }

  return CupertinoPageRoute(
    builder: (context) => const DashboardScreen(),
  );
}
