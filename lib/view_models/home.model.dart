import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/controllers/home.controller.dart';
import 'package:flutter_boilerplate/data_models/counter_data.dart';
import 'package:momentum/momentum.dart';

// View models are models which are associated to a View.
// Don't confuse these with the ViewModels of MVVM architecture.
// These are simply models which hold data for a view. The actions/events are still under the domain of a controller.

class CounterModel extends MomentumModel<CounterController> {
  final int value;
  final Counterdata apiResponse;
  CounterModel(
    CounterController controller, {
    this.value,
    this.apiResponse,
  }) : super(controller);

  @override
  void update({
    int value,
    Counterdata apiResponse,
  }) {
    CounterModel(
      controller,
      value: value ?? this.value,
      apiResponse: apiResponse ?? this.apiResponse,
    ).updateMomentum();
  }
}
