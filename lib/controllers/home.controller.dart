import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/components/flush_bar.dart';
import 'package:flutter_boilerplate/data_models/counter_data.dart';
import 'package:flutter_boilerplate/view_models/home.model.dart';
import 'package:momentum/momentum.dart';

// This is a controller for a view and a model.
// Keep all your business logic here.
// Trigger your API calls here and set the data in the ViewModels from here as well.
// Add .controller suffix to denote association with a model and a view.

class CounterController extends MomentumController<CounterModel> {
  @override
  CounterModel init() {
    return CounterModel(this, value: 0);
  }

  void increment() {
    var value = model.value;
    model.update(value: value + 1);
    print(model.value);
  }

  void decrement() {
    var value = model.value;
    model.update(value: value - 1);
    print(model.value);
  }

  void displayMessage(context) {
    notifyError(context);
  }

  void checkJson() {
    Map dataMap = jsonDecode(r'{"value": 999, "nested": {"value": 123}}');
    var json = Counterdata.fromJson(dataMap);
    model.update(apiResponse: json, value: json.value);
  }

  void goToCommonUI(context) {
    Navigator.pushNamed(context, "/secondaryScreen");
  }
}
