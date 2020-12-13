import 'package:flutter_boilerplate/controllers/app_boot.controller.dart';
import 'package:momentum/momentum.dart';

// View models are models which are associated to a View.
// Don't confuse these with the ViewModels of MVVM architecture.
// These are simply models which hold data for a view. The actions/events are still under the domain of a controller.

class AppBootModel extends MomentumModel<AppBootController> {
  final String token;
  AppBootModel(
    AppBootController controller, {
    this.token,
  }) : super(controller);

  @override
  void update({String token}) {
    AppBootModel(
      controller,
      token: token ?? this.token,
    ).updateMomentum();
  }

// Adding toJson and fromJson to a MomentumModel will make it persist between app sessions.
  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }

  AppBootModel fromJson(Map<String, dynamic> json) {
    return AppBootModel(
      controller,
      token: json['token'],
    );
  }
}
