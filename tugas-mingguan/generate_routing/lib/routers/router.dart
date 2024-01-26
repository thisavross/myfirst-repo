import 'package:flutter/material.dart';

import 'package:generate_routing/views/home_page.dart';
import 'package:generate_routing/views/first_page.dart';
import 'package:generate_routing/views/second_page.dart';
import 'package:generate_routing/views/unknown_page.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/first':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/seconds':
        return MaterialPageRoute(builder: (_) => SecondsPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => UnknownPage());
    }
  }
}
