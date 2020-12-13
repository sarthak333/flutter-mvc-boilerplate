import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/components/common_wrapper.dart';
import 'package:flutter_boilerplate/services/app_boot.service.dart';
import 'package:flutter_boilerplate/views/common_ui.dart';
import 'package:flutter_boilerplate/controllers/home.controller.dart';
import 'package:flutter_boilerplate/views/home.view.dart';
import 'package:flutter_boilerplate/views/splash.view.dart';
import 'package:flutter_boilerplate/controllers/app_boot.controller.dart';
import 'package:momentum/momentum.dart';
import 'package:catcher/catcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Catcher is responsible for catching errors globally. Can be customized according to our requirements.
  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["support@email.com"])
  ]);

  Catcher(
    momentum(),
    enableLogger: true,
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}

Momentum momentum() {
  return Momentum(
    // list all the controllers here for initialization.
    controllers: [CounterController(), AppBootController()],
    // list all the services here.
    services: [AppBootService()],
    child: MyApp(),
    // persistSave will convert compatible models to json and save it into our storage of choice
    persistSave: (context, key, value) async {
      var sharedPref = await SharedPreferences.getInstance();
      var result = await sharedPref.setString(key, value);
      return result;
    },
    // persistGet will pick up the stored data, convert the json to dart objects and hydrate the models
    persistGet: (context, key) async {
      var sharedPref = await SharedPreferences.getInstance();
      var result = sharedPref.getString(key);
      return result;
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Catcher.navigatorKey,
      title: 'Momentum State Management',
      // All the screens will be mapped to a named route here.
      routes: {
        '/': (context) => CommonWrapper(child: Splash()),
        '/Home': (context) => CommonWrapper(child: HomeWidget()),
        '/secondaryScreen': (context) => CommonWrapper(child: CommonUI()),
      },
    );
  }
}
