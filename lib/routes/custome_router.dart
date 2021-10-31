import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcoder_localization/pages/about_page.dart';
import 'package:podcoder_localization/pages/home_page.dart';
import 'package:podcoder_localization/pages/not_found_page.dart';
import 'package:podcoder_localization/pages/setting_page.dart';
import 'package:podcoder_localization/routes/router_names.dart';

class CustomeRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
        break;
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
        break;
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
