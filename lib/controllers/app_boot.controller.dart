import 'dart:math';

import 'package:flutter_boilerplate/common/apollo_client.dart';
import 'package:flutter_boilerplate/services/app_boot.service.dart';
import 'package:flutter_boilerplate/view_models/app_boot.model.dart';
import 'package:momentum/momentum.dart';
import 'package:flutter/material.dart';

// This is a controller for a view and a model.
// Keep all your business logic here.
// Trigger your API calls here and set the data in the ViewModels from here as well.
// Add .controller suffix to denote association with a model and a view.

class AppBootController extends MomentumController<AppBootModel> {
  @override
  AppBootModel init() {
    return AppBootModel(this, token: "No token yet");
  }

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future randomQuery() async {
    var appBootService = getService<AppBootService>();
    var response = await appBootService.makeAQuery();
    if (response.success) {
      print(response.toString());
    }
  }

  void updateToken() {
    model.update(token: getRandomString(16));
  }

  void goToCounter(context) {
    Navigator.pushNamed(context, "/Home");
  }

  void handleAppBoot() {
    setupApolloClient(model.token);
  }
}
